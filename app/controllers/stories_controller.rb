class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.xml
  def index
    @stories = Story.published
    @popular_stories = Vote.popular_stories
    @popular_tags = Vote.popular_tags
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])
    #vote = Vote.new
    #vote.story =  @story
    #vote.sentiment = 0
    #vote.save
    
    render :layout => "frame" 
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @story }
    #end
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        format.html { redirect_to(@story) }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to(@story) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to(stories_url) }
      format.xml  { head :ok }
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
       format.html { redirect_to(stories_url) }
       format.xml  { head :ok }
     end 
    
  end 
  
  def opinion
    @story = Story.find(params[:id])
  end  
  
  def opinion_save
    @story = Story.find(params[:id])
    @story.comments.create({:story=>@story,:opinion=>params[:comment][:opinion]})
    respond_to do |format|
      
     flash[:notice] = 'Your opinion has been added.'
      format.html { redirect_to(opinion_story_path(@story)) }
      format.xml  { head :ok }
    end
  end
  
end
