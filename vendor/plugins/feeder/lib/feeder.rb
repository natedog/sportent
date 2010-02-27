# Feeder
require 'feed-normalizer'
require 'open-uri'


module Feeder
    
  class Feeder  
    
   def self.fetch(url)
     feed = FeedNormalizer::FeedNormalizer.parse open(url)
     feed.entries
  end

 end
 
end 