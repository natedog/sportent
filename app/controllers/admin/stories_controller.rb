class Admin::StoriesController < Admin::BaseController
  # GET /stories
  # GET /stories.xml
  def index
    @stories = Story.accepted

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
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
      format.html { redirect_to(admin_stories_url) }
      format.xml  { head :ok }
    end
  end
  
  def fetch
    @rssfeed = Rssfeed.find(params[:id])
    @stories = Feeder::Feeder.fetch(@rssfeed.url)
    
    respond_to do |format|
      
      format.html # show.html.erb
      format.xml  { render :xml => @rssfeed }
    end
  end 
  
  def save_fetched
     @rssfeed = Rssfeed.find(params[:id])
     fetched_stories = Feeder::Feeder.fetch(@rssfeed.url)
    # render params.inspect
     stories_to_accept = params[:accepted][:urls]
      
     stories_to_accept.each do |story_url|
        fetched_stories.each do |story|
          if story.url == story_url 
              s = Story.new
              s.url = story.url
              s.summary = story.description
              s.title = story.title
              s.accepted = true
              s.accepted_at = Time.now 
              s.sport = @rssfeed.sport
              s.original_publish_at = story.date_published
              s.save
              #render "save me"
          end  
        end  
     end   
      
  end 
  
  def publish
      @story = Story.find(params[:id])
      
  end
  
end
