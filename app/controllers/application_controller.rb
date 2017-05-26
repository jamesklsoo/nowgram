class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  helper_method :current_user
  #makes the controllers methods available to the view.
private

def current_user
  @current_user ||= User.find(session[:user]) if session[:user]
end
  
end
