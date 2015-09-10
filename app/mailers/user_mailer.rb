class UserMailer < ApplicationMailer
    default from: 'postmaster@sandboxb20f7fdf41be4c7891ae183a7fd8ebb7.mailgun.org'
    
    def welcome_email(user)
        @user = user
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: "Welcome to Blocmarks!")
    end

end
