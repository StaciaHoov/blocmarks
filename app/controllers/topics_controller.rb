class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @new_topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @user = current_user
    @topic = @user.topics.create(params.require(:topic).permit(:title))
    
    if @topic.save
      flash[:notice]= "New topic added"
    else
      flash[:error] = "There was an error adding a new topic."
    end
    redirect_to :back
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    
    if @topic.destroy
      flash[:notice]= "Topic successfully removed"
    else
      flash[:error]= "There was an error deleting that topic."
    end
    redirect_to :back
  end
        
  def update
    @topic = Topic.find(params[:id])
    
    if @topic.update_attributes(params.require(:topic).permit(:title))
      flash[:notice] = "Topic updated."
    else
      flash[:error] = "There was a problem updating the topic."
    end
    redirect_to topics_path
  end
  
end
  
