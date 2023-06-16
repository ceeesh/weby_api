class Api::V1::ClientsController < ApplicationController

  # GET show
  def show
    if current_user
      @user = current_user
      render json: @user
    end
  end

  # POST update user data
  def update 
    @client = current_user

    if @client.update(edit_params)
      render json: {
        edited: true,
        user: {
          id: @client.id,
          first_name: @client.first_name,
          last_name: @client.last_name,
          email: @client.email,
          token: @client.token,
          verified: @client.verified,
          birthday: @client.birthday,
          gender: @client.gender,
          phone_number: @client.phone_number,
          country: @client.country
        }
      }
    else
      render json: { error: @client.errors.full_messages }, status: 400
    end
  end

  # def upload_photo
  #   # grabbing user from the db using the id from the query string parameters
  #   # i used strong params
  #   @client = current_user
  
  #   @client.profile_picture.attach(profile_picture_params[:profile_picture])
  
  #   if @client.profile_picture.attached?
  #     profile_picture_serializer = ProfilePictureSerializer.new(profile_picture: @client.profile_picture, user: @client)
  #     render json: profile_picture_serializer.serialize_new_profile_picture()
  #   else
  #     render json: {errors: "No profile picture attached"}, status: 400
  #   end
  # end

  private

  def profile_picture_params
    params.permit(:profile_picture, :id)
  end

  def edit_params
    params.permit(:first_name, :last_name, :birthday, :gender, :phone_number, :country)
  end

  def client_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :birthday, :gender, :phone_number, :country)
  end

end