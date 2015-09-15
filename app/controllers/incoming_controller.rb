class IncomingController < ApplicationController
   # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
    skip_before_action :verify_authenticity_token, only: [:create]
    
    def create
        user = User.where(email: params[:sender]).first   # Find the user by using params[:sender]
        
        if user
            topic = Topic.where(title: params[:subject]).first_or_create   # Find the topic by using params[:subject]
            url = params["body-plain"]   # Assign the url to a variable after retreiving it from params["body-plain"]
            topic.bookmarks.create!(url: url, title: url)   # Now that you're sure you have a valid user and topic, build and save a new bookmark
        end
        head 200
    end
end