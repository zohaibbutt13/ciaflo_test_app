class UsersController < ApplicationController
  skip_before_action :user_authorized, only: [:create, :login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: @user.errors.full_messages }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: user_params[:email], password: user_params[:password])

    if @user
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "Invalid Email or Password" }
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
