class BookmarksController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:url, :title, :user_id))
    @bookmark.user = current_user
    authorize @bookmark
    
    if @bookmark.save
      flash[:notice] = "Bookmark successfully created."
    else
      flash[:error]= "There was an error saving the bookmark. Please try again."
    end
    redirect_to :back
  end

  def destroy
    @user = current_user
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted."
    else
      flash[:error] = "There was a problem deleting the bookmark."
    end
    redirect_to @topic
  end
  
  def update?
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.update_attribute(params.require(:bookmark).permit(:url, :title, :user_id))
      flash[:notice] = "Bookmark updated."
    else
      flash[:error] = "There was a problem updating the bookmark."
    end
    redirect_to :back
  end
end
