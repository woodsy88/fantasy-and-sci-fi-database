class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :password, :password_confirmation, :email, :email_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end  

  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to access this page."
      redirect_to(request.referrer || root_path)
    end  
end
