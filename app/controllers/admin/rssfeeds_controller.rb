class Admin::RssfeedsController < Admin::BaseController
  # GET /rssfeeds
  # GET /rssfeeds.xml
  def index
    @rssfeeds = Rssfeed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rssfeeds }
    end
  end

  # GET /rssfeeds/1
  # GET /rssfeeds/1.xml
  def show
    @rssfeed = Rssfeed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rssfeed }
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
  
  


  # GET /rssfeeds/new
  # GET /rssfeeds/new.xml
  def new
    @rssfeed = Rssfeed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rssfeed }
    end
  end

  # GET /rssfeeds/1/edit
  def edit
    @rssfeed = Rssfeed.find(params[:id])
  end

  # POST /rssfeeds
  # POST /rssfeeds.xml
  def create
    @rssfeed = Rssfeed.new(params[:rssfeed])

    respond_to do |format|
      if @rssfeed.save
        flash[:notice] = 'Rssfeed was successfully created.'
        format.html { redirect_to(@rssfeed) }
        format.xml  { render :xml => @rssfeed, :status => :created, :location => @rssfeed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rssfeed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rssfeeds/1
  # PUT /rssfeeds/1.xml
  def update
    @rssfeed = Rssfeed.find(params[:id])

    respond_to do |format|
      if @rssfeed.update_attributes(params[:rssfeed])
        flash[:notice] = 'Rssfeed was successfully updated.'
        format.html { redirect_to(@rssfeed) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rssfeed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rssfeeds/1
  # DELETE /rssfeeds/1.xml
  def destroy
    @rssfeed = Rssfeed.find(params[:id])
    @rssfeed.destroy

    respond_to do |format|
      format.html { redirect_to(rssfeeds_url) }
      format.xml  { head :ok }
    end
  end
end
