class SocialTagsController < ApplicationController
  # GET /sports
  # GET /sports.xml
  def index
    @sports = Sport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sports }
    end
  end

  # GET /sports/1
  # GET /sports/1.xml
  def show
    @social_tag = SocialTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sport }
    end
  end
end
