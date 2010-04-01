class StoryTag < ActiveRecord::Base
  belongs_to :story
  belongs_to :social_tag
  belongs_to :sport
  
  
   
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
  
   
   
end
