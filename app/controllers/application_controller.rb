class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  layout :determine_layout

  private
  	def determine_layout
  		user_signed_in? ? "application" : "login"
  	end

end
