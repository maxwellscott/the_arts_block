class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :performer
      t.string :date
      t.string :time
      t.text :description
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
