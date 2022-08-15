class UsersController < ApplicationController
  def login
    @user = User.find_by_email!(params[:email])
    if @user&.valid_password?(params[:password])
      render json: { message: 'Logged in successfully!!', user: @user }, status: :ok
    else
      render json: { error: 'Invalid login details'}, status: :unauthorized
    end
  end

  def signup
    if params[:name].present? &&
       params[:email].present? &&
       params[:password].present? &&
       params[:password_confirmation].present?

      if params[:password] == params[:password_confirmation]
        @user = User.create!(
          name: allowed_params[:name], email: allowed_params[:email],
          password: params[:password], password_confirmation: params[:password_confirmation]
        )
           if @user.save
            render json: { message: 'Successfully signed up!!', user: @user }, status: :created 
           end 
      else
        render json: { error: 'Please confirm again your password!' }, status: :conflict 
      end
    else
      render json: { eror: 'Missing signup details'}, status: :partial_content
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
