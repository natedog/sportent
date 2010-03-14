class StoryTag < ActiveRecord::Base
  belongs_to :story
  belongs_to :social_tag
  belongs_to :sport
   
  def vote_up
      self.votes = self.votes.to_i+1
      self.score = self.score.to_i+1
      self.save
  end

  def vote_down
    self.votes = self.votes.to_i+1
    self.score = self.score.to_i-1
    self.save
  end
  
   
   
end
