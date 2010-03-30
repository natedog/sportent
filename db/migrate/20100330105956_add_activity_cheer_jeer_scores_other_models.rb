class AddActivityCheerJeerScoresOtherModels < ActiveRecord::Migration
  def self.up
    add_column :stories, :total_cheers, :integer
    add_column :stories, :total_jeers, :integer
    add_column :stories, :total_activity, :integer
    
    add_column :social_tags, :total_cheers, :integer
    add_column :social_tags, :total_jeers, :integer
    add_column :social_tags, :total_activity, :integer
    
    add_column :story_tags, :total_cheers, :integer
    add_column :story_tags, :total_jeers, :integer
    add_column :story_tags, :total_activity, :integer
  end

  def self.down
    
    remove_column :stories, :total_cheers
    remove_column :stories, :total_jeers
    remove_column :stories, :total_activity
    
    remove_column :social_tags, :total_cheers
    remove_column :social_tags, :total_jeers
    remove_column :social_tags, :total_activity
    
    remove_column :story_tags, :total_cheers
    remove_column :story_tags, :total_jeers
    remove_column :story_tags, :total_activity

  end
end
