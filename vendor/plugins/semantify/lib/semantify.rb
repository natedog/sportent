# Semantify

require 'open-uri'
require 'nokogiri'



module Semantify
  
  
  
    
  class Semantify 

    
   def self.fetch(url)
        
        # WORK OUT HOW TO MAKE THESE CONSTANTS
        openamplify_API_key = "eup9b9epknxn6fvumtdxqprc3x4d58vr" 
        alchemy_API_key = "a3bbc19ddac62cf366b45c1f6f83584bbca312e2"
        alchemy_API_url_entity = "http://access.alchemyapi.com/calls/url/URLGetRankedNamedEntities"
        alchemy_API_url_keyword = "http://access.alchemyapi.com/calls/url/URLGetKeywords"
       
        #puts alchemy_API_url+"?url="+url+"&apikey="+alchemy_API_key
       
        document = Nokogiri::XML(open(alchemy_API_url_entity+"?url="+url+"&apikey="+alchemy_API_key))
        entities = document.css("entity")
        semantic_entities = []
        entities.each do |entity|
            type = entity.css("type")
            text = entity.css("text")
            count = entity.css("count")
            semantic_entities << {:tag=> text.text,:type=>type.text,:count=>count.text}
          
        end 
        
        document = Nokogiri::XML(open(alchemy_API_url_keyword+"?url="+url+"&apikey="+alchemy_API_key))
        keywords = document.css("keyword")
        semantic_keywords = []
        keywords.each do |keyword|

            semantic_keywords << keyword.text
          
        end 
        
        results ={:entities=> semantic_entities,:keywords=>semantic_keywords}
        
        results    
            
        
   end
   
   def send(text)
     
   end     

 end
 
end