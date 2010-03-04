class Story < ActiveRecord::Base
  
    belongs_to :sport
    
    named_scope :accepted, :conditions=> {:accepted=> true}

end
