class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @new_topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.create(params.require(:topic).permit(:title))
    if @topic.save
      flash[:notice]= "New topic added"
    else
      flash[:error] = "There was an error adding a new topic."
    end
    redirect_to :back
  end
  
  def edit
  end
end
  
