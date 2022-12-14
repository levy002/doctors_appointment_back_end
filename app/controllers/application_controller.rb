class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |_e|
    render json: { error: 'Please add valid email!!' }, status: :unauthorized
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
