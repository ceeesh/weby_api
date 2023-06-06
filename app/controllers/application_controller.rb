class ApplicationController < ActionController::API
  # skip_before_action :verify_authenticity_token
  before_action :current_user

  def current_user
    @header = request.headers['Authorization']

    current_user = Client.find_by(token: @header)
    if current_user.present?
      return current_user
    else
      render json: { error: 'Unauthorized' }, status: :unprocessable_entity 
    end
  end

#   begin 
#     @decoded = jwt_decode(header)
#     @current_user = User.find(@decoded[:user_id])
# rescue ActiveRecord::RecordNotFound => e
#     render json: { errors: e.message }, status: 404
# rescue JWT::DecodeError => e
#     render json: { errors: e.message }, status: 401
# end

  # def require_token
  #   # hmac_secret = 'my$ecretK3y'
  #   if request.headers['Authorization'].present?
  #     # decoded_token = JWT.decode request.headers['Authorization'], hmac_secret, true, { algorithm: 'HS256' }
  #     @user = Client.find_by(token: request.headers[:Authorization])
  #     render json: { error: 'Unauthorized' }, status: :unprocessable_entity unless @user
  #   else
  #     render json: { error: 'Unauthorized' }, status: :unprocessable_entity 
  #   end
  # end

end
