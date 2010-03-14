class AddStoryTagToVotes < ActiveRecord::Migration
  def self.up
     add_column :votes, :story_tag_id, :integer
  end

  def self.down
    remove_column :votes, :story_tag_id
  end
end
