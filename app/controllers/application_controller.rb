class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info, :error, :warning


  ActionMailer::Base.smtp_settings = {


    :address => 'smtp.gmail.com',
    :domain => 'mail.google.com',
    :port => 587,
    :user_name => ENV['MAILER_EMAIL'],
    :password => ENV['MAILER_PASSWORD'],
    :authentication => 'login',
    :enable_starttls_auto => true
  }
  
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end