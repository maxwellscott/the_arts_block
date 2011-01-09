class AddOpenerOneToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :opener_one, :string
  end

  def self.down
    remove_column :events, :opener_one
  end
end
