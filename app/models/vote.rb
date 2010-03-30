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
  
  
  
  def aggregate_votes(choice)
      
      if choice == "cheer"
        self.cheer
      elsif choice == "jeer"  
        self.cheer
      else  
        self.activity
      end  
      
  end
  
  def cheer
    
  
  end
  
  def jeer
      
  
  end
  
  def activity
      
  
  end
      
  
end
