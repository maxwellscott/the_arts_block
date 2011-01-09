class AddMainActUrlToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :main_act_url, :string
  end

  def self.down
    remove_column :events, :main_act_url
  end
end
