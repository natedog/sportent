class AddAdditonalColumnsStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :accepted, :boolean
    add_column :stories, :published, :boolean
    add_column :stories, :source, :integer
    add_column :stories, :source_type, :string
    add_column :stories, :published_at, :datetime
    add_column :stories, :accepted_at, :datetime
  end

  def self.down
    remove_column :stories, :accepted
    remove_column :stories, :published
    remove_column :stories, :source
    remove_column :stories, :source_type
    remove_column :stories, :published_at
    remove_column :stories, :accepted_at
  end
end
