class AddSitetwoToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :sitetwo, :string
    add_column :events, :sitethree, :string
  end

  def self.down
    remove_column :events, :sitetwo
    remove_column :events, :sitethree
  end
end
