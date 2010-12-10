class AddPerformersToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :performertwo, :string
    add_column :events, :performerthree, :string
  end

  def self.down
    remove_column :events, :performertwo
    remove_column :events, :performerthree
  end
end
