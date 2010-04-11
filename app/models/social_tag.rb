class SocialTag < ActiveRecord::Base
  has_many :stories, :through => :story_tags
  has_many :story_tags
  has_many :votes
  belongs_to :sport
  #before_create :if_exists
  
  
  def cheer
      self.total_cheers = self.total_cheers.to_i+1
      self.save
      self.total_cheers
  end

  def jeer
    self.total_jeers = self.total_jeers.to_i+1
    self.save
    self.total_jeers
  end
  
  def activity
    self.total_activity = self.total_activity.to_i+1
    self.save
    self.total_activity
    
  end
  
  def if_exists
    name = self.name
    sport = self.sport
    
    existing_tag = SocialTag.find(:first,:conditions => "name = '#{name}' AND sport_id='#{sport.id}'")
    
  end  
  
  def totals_this_week
      Vote.social_tags(self.id).last
  end
  
  def totals_last_week
      Vote.social_tags(self.id).totals_last_week.first
  end
  
  def totals_last_fortnight
      Vote.social_tags(self.id).totals_last_fortnight.first
  end
  
  def activity_this_week
      totals_this_week.total_social_tag_activity-activity_last_week
  end 
  
  def activity_last_week
      
      if totals_last_week != nil
        totals_last_week.total_social_tag_activity-activity_last_fortnight
      else
         totals_last_week = 0
      end    
    
        
  end 
  
  def activity_last_fortnight
       
       if totals_last_fortnight != nil
         totals_last_fortnight.total_social_tag_activity 
       else
         totals_last_fortnight = 0
       end             
  end
  
  def cheers_this_week
      totals_this_week.total_social_tag_cheers-cheers_last_week
  end 
  
  def cheers_last_week
      
      if totals_last_week != nil
        totals_last_week.total_social_tag_cheers-cheers_last_fortnight
      else
         totals_last_week = 0
      end    
    
        
  end 
  
  def cheers_last_fortnight
       
       if totals_last_fortnight != nil
         totals_last_fortnight.total_social_tag_cheers 
       else
         totals_last_fortnight = 0
       end             
  end
  
  def jeers_this_week
      totals_this_week.total_social_tag_jeers-jeers_last_week
  end 
  
  def jeers_last_week
      
      if totals_last_week != nil
        totals_last_week.total_social_tag_jeers-jeers_last_fortnight
      else
         totals_last_week = 0
      end    
    
        
  end 
  
  def jeers_last_fortnight
       
       if totals_last_fortnight != nil
         totals_last_fortnight.total_social_tag_jeers 
       else
         totals_last_fortnight = 0
       end             
  end
  
  
end
