class CombineItemsInCart < ActiveRecord::Migration
  def self.up
    # replace multiple items for a single event in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each event in the cart
      sums = cart.line_items.group(:event_id).sum(:quantity)

      sums.each do |event_id, quantity|
        if quantity > 1
          # remove individual items
          cart.line_items.where(:event_id=>event_id).delete_all

          # replace with a single item
          cart.line_items.create(:event_id=>event_id, :quantity=>quantity)
        end
      end
    end
  end

  def self.down
    # split items with quantity>1 into multiple items
    LineItem.where("quantity>1").each do |lineitem|
      # add individual items
      lineitem.quantity.times do
        LineItem.create :cart_id=>lineitem.cart_id, :event_id=>lineitem.event_id, :quantity=>1
      end
      
      # remove original item
      lineitem.destroy
    end
  end
end
