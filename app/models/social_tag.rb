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
  

  
end
