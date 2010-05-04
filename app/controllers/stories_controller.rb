class StoriesController < ApplicationController
  
  before_filter :login_required, :only => [:new, :create, :vote, :opinion_save]

  
  # GET /stories
  # GET /stories.xml
  def index
    if params[:sport] 
      sport = Sport.slug(params[:sport])
      @sport = sport.first
      #render " #{sport}"
      @stories = Story.published.sport(@sport.id)
    else     
      @stories = Story.published
    end  
    
    
    
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
    @story.source_type = "user"
    @story.accepted = true
    @story.published = nil
    @story.original_publish_at = DateTime.now
    @story.accepted_at = DateTime.now
    respond_to do |format|
      if @story.save
        flash[:notice] = 'Your Story. '+@story.title+'. <p>Has been submited.</p>'
        format.html { redirect_to("/") }
        #format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end


  
  def vote
     
     story_tag = StoryTag.find(params[:id])
     choice = params[:choice]
     
       
     
     vote = Vote.new do |v|  
          v.story = story_tag.story
          v.social_tag = story_tag.social_tag
          v.sport = story_tag.sport
          v.story_tag = story_tag
          
          
     end
     vote.aggregate(choice)
     vote.save
     
     current_user.twitter.post('/statuses/update.json','status'=> choice+'s for '+story_tag.social_tag.name+' '+story_tag.story.short_url)
     
     
     respond_to do |format|
       
      flash[:notice] = 'Your '+choice.capitalize+' for '+story_tag.social_tag.name+' has been registered.'
       format.html { redirect_to(params[:return_to]) }
       format.xml  { head :ok }
     end 
    
  end 
  
  def opinion
    @story = Story.find(params[:id])
  end  
  
  def opinion_save
    @story = Story.find(params[:id])
    @story.comments.create({:story=>@story,:opinion=>params[:comment][:opinion]})
    
    current_user.twitter.post('/statuses/update.json','status'=> params[:comment][:opinion]+' -- '+@story.short_url)
    
    
    respond_to do |format|
      
     flash[:notice] = 'Your opinion has been added.'
      format.html { redirect_to(opinion_story_path(@story)) }
      format.xml  { head :ok }
    end
  end
  
end
