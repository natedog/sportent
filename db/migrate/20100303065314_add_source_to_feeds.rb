class AddSourceToFeeds < ActiveRecord::Migration
  def self.up
       add_column :rssfeeds, :source, :string
  end

  def self.down
     remove_column :rssfeeds, :source
  end
end
