class AddPriorityToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :priority, :integer
  end

  def self.down
    remove_column :events, :priority
  end
end
