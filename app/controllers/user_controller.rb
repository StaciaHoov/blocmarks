class UsersController < ApplicationController
    
    def create
        @user = User.new(params[:user])
        
        respond_to do |format|
            if @user.save
                #sends email to user when user is created
                UserMailer.welcome_email(@user).deliver
                
                format.html { redirect_to(@user, notice: 'User was succesfully created.') }
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
end
