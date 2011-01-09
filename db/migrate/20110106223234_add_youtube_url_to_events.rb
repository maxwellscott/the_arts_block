class AddYoutubeUrlToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :youtube_url, :string
  end

  def self.down
    remove_column :events, :youtube_url
  end
end
