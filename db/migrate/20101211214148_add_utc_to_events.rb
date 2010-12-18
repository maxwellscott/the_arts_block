class AddUtcToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :utc, :datetime
  end

  def self.down
    remove_column :events, :utc
  end
end
