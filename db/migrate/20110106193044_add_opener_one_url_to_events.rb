class AddOpenerOneUrlToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :opener_one_url, :string
  end

  def self.down
    remove_column :events, :opener_one_url
  end
end
