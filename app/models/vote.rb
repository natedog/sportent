class Vote < ActiveRecord::Base
  belongs_to :story
  belongs_to :social_tag
  belongs_to :sport
  belongs_to :story_tag
  
  
  named_scope :popular_stories, :group => 'story_id', :order=> "created_at DESC", :limit=>10
  named_scope :popular_tags, :group => 'social_tag_id' , :order=> "created_at DESC" ,:limit=>10
  
  named_scope :totals_last_week,  :conditions => ['created_at >= :lastweek  AND created_at < :six_days' , {:lastweek=> 1.week.ago,:six_days=>6.day.ago}], :order=> "created_at DESC"  ,:limit=>1 
  named_scope :totals_last_fortnight,  :conditions => ['created_at >= :last_fortnight  AND created_at < :thirteen_days' , {:last_fortnight=> 2.week.ago,:thirteen_days=>13.day.ago}], :order=> "created_at DESC"  ,:limit=>1   
  
  named_scope :social_tags, lambda {|*args| {:conditions=>{:social_tag_id => args.first || "1"}}}
  
  #named_scope :popular_stories,:select => 'DISTINCT ON (story_id) story_id,created_at,id',  :order=> "story_id,created_at DESC", :limit=>10
  #named_scope :popular_tags, :select => 'DISTINCT ON (social_tag_id) social_tag_id,created_at,id',  :order=> "social_tag_id,created_at DESC" ,:limit=>10
  
  
  
  def aggregate(choice)
      
      self.total_social_tag_cheers = self.social_tag.total_cheers
      self.total_story_tag_cheers = self.story_tag.total_cheers
      self.total_story_cheers = self.story.total_cheers
      
      self.total_social_tag_jeers = self.social_tag.total_jeers
      self.total_story_tag_jeers = self.story_tag.total_jeers
      self.total_story_jeers = self.story.total_jeers
      
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
