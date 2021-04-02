class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user_email = session[:user]
    @role = ENV['ADMIN_EMAILS'].include?(@user_email) ? 'Admin' : 'Authenticated User' 
  end
end