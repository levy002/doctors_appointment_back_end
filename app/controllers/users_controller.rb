class UsersController < ApplicationController
  def login
    @user = User.find_by_email!(params[:email])
    if @user&.valid_password?(params[:password])
      render json: { data: { message: 'Logged in successfully!!', user: @user }, status: :ok}
    else
      render json: { data: { message: 'Invalid login details', user: {} }, status: :unauthorized}
    end
  end

  def signup
    if params[:name].present? &&
       params[:email].present? &&
       params[:password].present? &&
       params[:password_confirmation].present?
      if params[:password] == params[:password_confirmation]
        @user = User.create(
          name: allowed_params[:name], email: allowed_params[:email],
          password: params[:password], password_confirmation: params[:password_confirmation]
        )
        render json: {data: { message: 'Successfully signed up!!', user: @user }, status: :created}
      else
        render json: {data: { message: 'Password missmatch', user: {} }, status: :conflict}
      end
    else
      render json: { data: { message: 'missing signup details', user: {} }, status: :partial_content}
    end
  end


  private

  def allowed_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
