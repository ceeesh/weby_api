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
          verified: user.verified,
          birthday: user.birthday,
          gender: user.gender,
          phone_number: user.phone_number,
          country: user.country,
          admin: user.admin,
          profile_picture_url: user.profile_picture_url
        }
      }
    else
      render json: { error: "Incorrect Email or Password " }, status: 400
    end
  end

  # POST /signup
  def new_account
  
    if (signup_params[:password] == signup_params[:password_confirmation])

        @user, @error_messages = Client.signup(signup_params)
        if @error_messages.nil?
        render json: { success: "Registration Successful"}
       else
        render json: { error: @error_messages }, status: 400
       end
    else
        render json: { error: @error_messages }, status: 400
    end 
  end

  private

    def user_params
        params.permit(:email, :password)
    end

    def signup_params
        params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :birthday, :gender, :phone_number, :country)
    end
end