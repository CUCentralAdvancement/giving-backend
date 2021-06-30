class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @role = ENV['ADMIN_EMAILS'].include?(current_user.email) ? 'Admin' : 'Authenticated User'
    authorize :dashboard, :show?
  end
end
