class Dock::StoriesController < Dock::BaseController

  def show
   @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end
  
  def vote
     
     story_tag = StoryTag.find(params[:id])
     sentiment = params[:choice]
     
     if sentiment == "up"
        sentiment =  1
     else
        sentiment =  -1
     end        
     
     vote = Vote.new do |v|  
          v.story = story_tag.story
          v.social_tag = story_tag.social_tag
          v.sentiment = sentiment
          v.sport = story_tag.sport
          v.story_tag = story_tag
     end
     
     vote.save
     
     respond_to do |format|
       
      flash[:notice] = 'Your vote has been added.'
       format.html { redirect_to(dock_story_url(story_tag.story)) }
       format.xml  { head :ok }
     end 
    
  end


end
