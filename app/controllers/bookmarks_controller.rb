class BookmarksController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.create(params.require(:bookmark).permit(:url, :title))
    if @bookmark.save
      flash[:notice] = "Bookmark successfully created."
    else
      flash[:error]= "There was an error saving the bookmark. Please try again."
    end
    redirect_to :back
  end

  def edit
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted."
    else
      flash[:error] = "There was a problem deleting the bookmark."
    end
    redirect_to @topic
  end
end
