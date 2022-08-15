class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  def current_user
    User.first
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :name, :email,
        :password_confirmation, :password
      )
    end
  end
end
