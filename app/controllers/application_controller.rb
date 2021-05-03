class ApplicationController < ActionController::Base
  # def current_user
  #   @current_user ||= session[:user]

  #   # In the future, the user will exist in the db and be linked via email.
  #   # @current_user ||= User.find_by(email: session[:user]['info']['email'])
  # end
  # helper_method :current_user

  def user_signed_in?
    session[:user].present? ? true : false
  end
  helper_method :user_signed_in?

  private

  def authenticate_user!
    return if user_signed_in?
    redirect_to root_path, alert: "You must be signed in to continue."
  end
end
