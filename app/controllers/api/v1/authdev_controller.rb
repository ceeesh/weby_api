class Api::V1::AuthdevController < ApplicationController

  # POST /new_session
  def new_session
    hmac_secret = 'my$ecretK3y'
    
    if dev = Dev.signin(dev_params)
      payload = {
        id: dev.id
      }
      token = JWT.encode(payload, hmac_secret, 'HS256')
      response.set_header('Authorization', token)
      session[:token] = dev.token
      render json: {
        logged_in: true,
        dev: {
          id: dev.id,
          first_name: dev.first_name,
          last_name: dev.last_name,
          email: dev.email,
        }
      }
    else
      render json: { error: 'Unable to log in' }, status: 400
    end
  end

  # POST /signup
  def new_account
  
    if (signup_params[:password] == signup_params[:password_confirmation])
        
        @dev, @error_messages = dev.signup(signup_params)
        if @error_messages.nil?
        render json: @dev
       else
        render json: { error: @error_messages }, status: 400
       end
    else
        render json: { error: 'Unable to create user' }, status: 400
    end 
  end

  def logout
    # session[:token] = nil
    # redirect_to signin_path, notice: "Logged out"
  end

  private

    def dev_params
        params.permit(:email, :password)
    end

    def signup_params
      # debugger
        params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
end