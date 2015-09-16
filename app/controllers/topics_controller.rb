class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @new_topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
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
  
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice]= "Topic successfully removed"
    else
      flash[:error]= "There was an error deleting that topic."
    end
    redirect_to :back
  end
        
  def edit
  end
end
  
