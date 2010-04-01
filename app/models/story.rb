class Story < ActiveRecord::Base
  
    belongs_to :sport
    has_many :social_tags, :through => :story_tags
    has_many :story_tags
    has_many :comments
    
    named_scope :accepted, :conditions=> {:accepted=> true, :published=> nil}, :order=> "published_at DESC"
    named_scope :published, :conditions=> {:accepted=> true, :published=>true} , :order=> "published_at DESC"
    named_scope :sport, lambda {|*args| {:conditions=>{:sport_id => args.first || "1"}}}
    
    
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
