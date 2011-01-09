class AddOpenerTwoUrlToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :opener_two_url, :string
  end

  def self.down
    remove_column :events, :opener_two_url
  end
end
