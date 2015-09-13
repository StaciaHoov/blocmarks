class IncomingController < ApplicationController
   # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
    skip_before_action :verify_authenticity_token, only: [:create]
    
    def create
        puts "INCOMING PARAMS HERE: #{params}"
        # @user = User.find(params[:sender])   # Find the user by using params[:sender]
        # @topic = Topic.find(params[:subject])   # Find the topic by using params[:subject]
        # @url = params["body-plain"]   # Assign the url to a variable after retreiving it from params["body-plain"]
        
        # if @user == nil  # Check if user is nil, if so, create and save a new user
        #     @user = User.new(params[:id])
        #     @user.save
        # end
        
        # if @topic == nil   # Check if the topic is nil, if so, create and save a new topic
        #     @topic = User.topics.build(params[:topics_id])
        #     @topic.save
        # end
        
        # @bookmark = Bookmark.new(params[:topics_id, :url])   # Now that you're sure you have a valid user and topic, build and save a new bookmark
        # @bookmark.save
        head 200
    end
            
     

     

     


end