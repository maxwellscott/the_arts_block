class AddOpenerTwoToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :opener_two, :string
  end

  def self.down
    remove_column :events, :opener_two
  end
end
