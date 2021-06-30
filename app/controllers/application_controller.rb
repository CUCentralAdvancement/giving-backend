class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, except: :index
  # Placing this after the last action overwrites it. Trying `except: [:index, :devise_controller?]` did
  # not work.
  after_action :verify_authorized, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ spaces: [] }, :email, :password, :password_confirmation)
    end
  end

  # This was for trying to capture and handle certain errors. The attempt did not work, but this might be
  # helpful to leave in while learning.
  #
  # rescue_from ActionController::RoutingError, with: :render_not_found
  # rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  # rescue_from ActionController::ParameterMissing, with: :render_bad_request
  #
  #  def render_not_found
  #     flash[:alert] = "That route does not exist."
  #     render "home/show"
  #   end
  #
  # def render_record_not_found
  #   flash[:alert] = "That record does not exist."
  #   redirect_to(request.referrer || root_path)
  # end
  #
  # def render_bad_request
  #   flash[:alert] = "You are missing parameters...need to figure out how to show you all of them..."
  #   redirect_to(request.referrer || root_path)
  # end
end
