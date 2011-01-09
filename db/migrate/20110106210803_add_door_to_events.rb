class AddDoorToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :door, :decimal
  end

  def self.down
    remove_column :events, :door
  end
end
