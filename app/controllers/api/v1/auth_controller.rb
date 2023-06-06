class Api::V1::AuthController < ApplicationController
  skip_before_action :current_user

  # POST /new_session
  def new_session
    
    if user = Client.signin(user_params)
      render json: {
        logged_in: true,
        user: {
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          token: user.token,
          verified: user.verified
        }
      }
    else
      render json: { error: 'Unable to log in' }, status: 400
    end
  end

  # POST /signup
  def new_account
  
    if (signup_params[:password] == signup_params[:password_confirmation])
        
        @user, @error_messages = Client.signup(signup_params)
        if @error_messages.nil?
        render json: @user
       else
        render json: { error: @error_messages }, status: 400
       end
    else
        render json: { error: 'Unable to create user' }, status: 400
    end 
  end

  def logout

    # response.headers['Authorization'].delete
    render json: { succcess: 'Log out successfully'}
  end

  private

    def user_params
        params.permit(:email, :password)
    end

    def signup_params
        params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :role)
    end
end