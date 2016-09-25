class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  def after_sign_in_path_for(resource)
      if resource.class == User
        user_path(current_user.id)
      end
  end

  # unless  Rails.application.config.consider_all_requests_local
  # rescue_from Exception, :with => :render_404
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:dob,:email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:sex,:dob,:email, :password, :occupation) }
  end


  private

    def render_404
      render :template => 'error_pages/404', :layout => false, :status => :not_found
    end
end
