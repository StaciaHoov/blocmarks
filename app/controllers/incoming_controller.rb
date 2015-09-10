class IncomingController < ApplicationController
   # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
    skip_before_action :verify_authenticity_token, only: [:create]
    
    def create
        @user = User.find(params[:sender]) # Find the user by using params[:sender]
        @topic = Topic.find(params[:subject]) # Find the topic by using params[:subject]
        @url = params["body-plain"] # Assign the url to a variable after retreiving it from params["body-plain"]
        
        if @user == nil
            @user = User.new(params[:id])
            @user.save
        end
        
        if @topic == nil
            @topic = User.topics.build(params[:topics_id])
            @topic.save
        end
        
        @bookmark = Bookmark.new(params[:topics_id, :url])
        @bookmark.save
        #     flash[:notice] = "Bookmark successfully saved."
        #     render
        # else
        #     flash[:error] = "There was a problem saving the url."
    end
            
     # Check if user is nil, if so, create and save a new user

     # Check if the topic is nil, if so, create and save a new topic

     # Now that you're sure you have a valid user and topic, build and save a new bookmark


end