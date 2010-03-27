class SocialTag < ActiveRecord::Base
  has_many :stories, :through => :story_tags
  has_many :story_tags
  has_many :votes
  belongs_to :sport
  #before_create :if_exists
  
  
  def vote_up
      self.total_votes = self.total_votes.to_i+1
      self.score = self.score.to_i+1
      self.save
  end

  def vote_down
    self.total_votes = self.total_votes.to_i+1
    self.score = self.score.to_i-1
    self.save
  end
  
  def if_exists
    name = self.name
    sport = self.sport
    
    existing_tag = SocialTag.find(:first,:conditions => "name = '#{name}' AND sport_id='#{sport.id}'")
    
  end  
  

  
end
