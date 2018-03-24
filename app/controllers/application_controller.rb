class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  
  private
  
  def authenticate
    redirect_to login_path unless authenticated?
  end

  def authenticated?
    skip_authentication? || Authentication.authenticated?(current_user)
  end
  
  def skip_authentication?
    false
  end
end
