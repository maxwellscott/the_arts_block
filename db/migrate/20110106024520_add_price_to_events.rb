class AddPriceToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :price, :decimal
  end

  def self.down
    remove_column :events, :price
  end
end
