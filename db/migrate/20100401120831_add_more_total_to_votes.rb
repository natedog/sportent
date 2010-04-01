class AddMoreTotalToVotes < ActiveRecord::Migration
  def self.up
    
    remove_column :votes, :total_cheers
    remove_column :votes, :total_jeers
    remove_column :votes, :total_activity
    
    add_column :votes, :total_story_cheers, :integer
    add_column :votes, :total_story_jeers, :integer
    add_column :votes, :total_story_activity, :integer
    
    add_column :votes, :total_social_tag_cheers, :integer
    add_column :votes, :total_social_tag_jeers, :integer
    add_column :votes, :total_social_tag_activity, :integer
    
    add_column :votes, :total_story_tag_cheers, :integer
    add_column :votes, :total_story_tag_jeers, :integer
    add_column :votes, :total_story_tag_activity, :integer
  end

  def self.down
    add_column :votes, :total_cheers, :integer
    add_column :votes, :total_jeers, :integer
    add_column :votes, :total_activity, :integer
    
    remove_column :votes, :total_story_cheers
    remove_column :votes, :total_story_jeers
    remove_column :votes, :total_story_activity
    
    remove_column :votes, :total_social_tag_cheers
    remove_column :votes, :total_social_tag_jeers
    remove_column :votes, :total_social_tag_activity
    
    remove_column :votes, :total_story_tag_cheers
    remove_column :votes, :total_story_tag_jeers
    remove_column :votes, :total_story_tag_activity
    
    
    
  end
end
