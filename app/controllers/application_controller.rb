class ApplicationController < ActionController::Base
  #auth user before any action
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  #notice types
  add_flash_types :info, :error, :warning


  ActionMailer::Base.smtp_settings = {
    #change marked lines below to configure your gmail account that will send emails to users
    :address => 'smtp.gmail.com',
    :domain => 'mail.google.com',
    :port => 587,
    :user_name => ENV['MAILER_EMAIL'], #change this line to your email
    :password => ENV['MAILER_PASSWORD'], #change this line to your email password
    :authentication => 'login',
    :enable_starttls_auto => true
  }
  
  
  private

  #allows :name parameter for user to go through on new user sign-up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end