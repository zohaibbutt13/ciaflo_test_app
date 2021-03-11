class ApplicationController < ActionController::API
  before_action :user_authorized

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decoded_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ').last
      begin
        JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    @current_user   = nil
    if decoded_token
      user_id       = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
    @current_user
  end

  def logged_in?
    logged_in_user
  end

  def user_authorized
    render json: { message: 'Please log in First to Continue' }, status: :unauthorized unless logged_in?
  end
end
