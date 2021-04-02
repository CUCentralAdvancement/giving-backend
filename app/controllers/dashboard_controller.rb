class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = session[:user]
    @role = ENV['ADMIN_EMAILS'].include?(@user['info']['name']) ? 'Admin' : 'Authenticated User' 
  end
end