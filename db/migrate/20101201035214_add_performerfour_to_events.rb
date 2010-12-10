class AddPerformerfourToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :performerfour, :string
    add_column :events, :sitefour, :string
    add_column :events, :performerfive, :string
    add_column :events, :sitefive, :string
  end

  def self.down
    remove_column :events, :performerfour
    remove_column :events, :sitefour
    remove_column :events, :performerfive
    remove_column :events, :sitefive
  end
end
