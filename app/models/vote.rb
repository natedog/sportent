class Vote < ActiveRecord::Base
  belongs_to :story
  belongs_to :social_tag
  belongs_to :sport
  belongs_to :story_tag
  
  #after_save :aggregate_votes
  
  named_scope :popular_stories, :group => 'story_id', :order=> "created_at DESC", :limit=>10
  named_scope :popular_tags, :group => 'social_tag_id' , :order=> "created_at DESC" ,:limit=>10
  
  #named_scope :popular_stories,:select => 'DISTINCT ON (story_id) story_id,created_at,id',  :order=> "story_id,created_at DESC", :limit=>10
  #named_scope :popular_tags, :select => 'DISTINCT ON (social_tag_id) social_tag_id,created_at,id',  :order=> "social_tag_id,created_at DESC" ,:limit=>10
  
  
  
  def aggregate(choice)
      
      if choice == "cheer"
        self.cheer
      elsif choice == "jeer"  
        self.jeer
      end  
        self.activity
  end
  
  def cheer
      self.total_social_tag_cheers = self.social_tag.cheer
      self.total_story_tag_cheers = self.story_tag.cheer
      self.total_story_cheers = self.story.cheer
  
  end
  
  def jeer
      self.total_social_tag_jeers = self.social_tag.jeer
      self.total_story_tag_jeers = self.story_tag.jeer
      self.total_story_jeers = self.story.jeer      
  
  end
  
  def activity
    self.total_social_tag_activity = self.social_tag.activity
    self.total_story_tag_activity = self.story_tag.activity
    self.total_story_activity = self.story.activity      
  
  end
      
  
end
