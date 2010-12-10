class AddPushkinToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :pushkin, :boolean
  end

  def self.down
    remove_column :events, :pushkin
  end
end
