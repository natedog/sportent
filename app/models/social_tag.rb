class SocialTag < ActiveRecord::Base
  has_many :stories, :through => :story_tags
  has_many :story_tags
  has_many :votes
  belongs_to :sport
  
  
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
  

  
end
