# Semantify

require 'open-uri'
require 'nokogiri'



module Semantify
  
  
  
    
  class Semantify 

    
   def self.fetch(url)
        
        # WORK OUT HOW TO MAKE THESE CONSTANTS
        openamplify_API_key = "eup9b9epknxn6fvumtdxqprc3x4d58vr" 
        alchemy_API_key = "a3bbc19ddac62cf366b45c1f6f83584bbca312e2"
        alchemy_API_url = "http://access.alchemyapi.com/calls/url/URLGetRankedNamedEntities"
       
        puts alchemy_API_url+"?url="+url+"&apikey="+alchemy_API_key
       
        document = Nokogiri::XML(open(alchemy_API_url+"?url="+url+"&apikey="+alchemy_API_key))
        entities = document.search("entity")
        semantic_tags = []
        entities.each do |entity|
            semantic_tags << {:tag=> entity.text}
          
        end  
        
        semantic_tags   
            
        
   end
   
   def send(text)
     
   end     

 end
 
end