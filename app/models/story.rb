class Story < ActiveRecord::Base
  
    belongs_to :sport
    has_many :social_tags, :through => :story_tags
    has_many :story_tags
    has_many :comments
    
    named_scope :accepted, :conditions=> {:accepted=> true, :published=> nil}, :order=> "accepted_at DESC"
    named_scope :published, :conditions=> {:accepted=> true, :published=>true} , :order=> "published_at DESC"
    named_scope :sport, lambda {|*args| {:conditions=>{:sport_id => args.first || "1"}}}
    
    cattr_reader :per_page
    @@per_page = 10
    
    
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
    
    def shorten
      
      
      shortener = Bitly.new('cheerr', 'R_a37e4a40da2312342882685eeddccbfc')
      short_url = shortener.shorten('http://cheerr.heroku.com/stories/'+self.id.to_s)  
      short_url.jmp_url
      
    end  
    
    def short_url
      shorten
    end  
    
    def socialize
        Semantify::Semantify.fetch(self.url)
    end
    
    def is_owner(userid)
        if self.source_type == "user" && self.source.to_i == userid  
            return true
        else
            return false
        end  
        
    end    

end
