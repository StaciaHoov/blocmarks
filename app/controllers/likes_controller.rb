class LikesController < ApplicationController
    
    def create
        @bookmark = Bookmark.find(params[:bookmark_id])
        like = current_user.likes.build(bookmark: @bookmark)
        
        if like.save
            flash[:notice] = "You liked the bookmark!"
        else
            flash[:error] = "There was an error liking the bookmark."
        end
        redirect_to :back
    end
    
    def destroy
        @bookmark = Bookmark.find(params[:bookmark_id])
        like = current_user.likes.find(params[:id])
        
        if like.destroy
            flash[:notice] = "Bookmark is 'unliked'."
        else
            flash[:error] = "There was a problem 'unliking' the bookmark."
        end
        redirect_to :back
    end
end
