class AddOriginalPublishedAt < ActiveRecord::Migration
  def self.up
    add_column :stories, :original_publish_at, :datetime
  end

  def self.down
    remove_column :stories, :original_publish_at
  end
end
