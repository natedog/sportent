class ChangeVotesToTotalVotes < ActiveRecord::Migration
  def self.up
    rename_column :stories, :votes, :total_votes 
    rename_column :story_tags, :votes, :total_votes 
    rename_column :social_tags, :votes, :total_votes 
  end

  def self.down
    rename_column :stories, :total_votes, :votes 
    rename_column :story_tags, :total_votes, :votes 
    rename_column :social_tags, :total_votes, :votes
  end
end
