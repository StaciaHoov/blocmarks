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

# interceptor  makes sure that local mail only emails me
class DevelopmentMailInterceptor
    def self.delivering_email(message)
        message.to = 'postmaster@sandboxb20f7fdf41be4c7891ae183a7fd8ebb7.mailgun.org'
        message.cc = nil
        message.bcc = nil
    end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
    ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end    