class LineItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :cart

  def total_price
    event.price * quantity
  end

end
