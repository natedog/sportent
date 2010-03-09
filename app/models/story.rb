class Story < ActiveRecord::Base
  
    belongs_to :sport
    
    named_scope :accepted, :conditions=> {:accepted=> true}
    named_scope :published, :conditions=> {:accepted=> true, :published=>true} , :order=> "published_at DESC"
    
    



end
