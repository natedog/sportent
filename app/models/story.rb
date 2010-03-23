class Story < ActiveRecord::Base
  
    belongs_to :sport
    has_many :social_tags, :through => :story_tags
    has_many :story_tags
    has_many :comments
    
    named_scope :accepted, :conditions=> {:accepted=> true, :published=> nil}, :order=> "published_at DESC"
    named_scope :published, :conditions=> {:accepted=> true, :published=>true} , :order=> "published_at DESC"
    named_scope :sport, lambda {|*args| {:conditions=>{:sport_id => args.first || "1"}}}
    
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
