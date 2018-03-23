class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate
  
  private
  
  def authenticate
    redirect_to login_path unless authenticated?
  end
  
  def authenticated?
    Authentication.authenticated?
  end
end
