ActionMailer::Base.smtp_settings = {
    port: 587,
    address: 'smtp.mailgun.org',
    user_name: ENV['MAILGUN_SMTP_LOGIN'],
    password: ENV['MAILGUN_SMTP_PASSWORD'],
    domain: 'https://stacia-blocmarks.herokuapp.com/',
    authentication: :plain,
    content_type: 'text/html',
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true

#makes sure interceptor just makes sure that local mail only emails me
class DevelopmentMailInterceptor
    def self.delivering_email(message)
        message.to = 'staciaray@roadrunner.com'
        message.cc = nil
        message.bcc = nil
    end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
    ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end    