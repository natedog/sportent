class Dock::StoriesController < Dock::BaseController

  def show
   @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end


end
