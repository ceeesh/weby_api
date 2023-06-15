class Api::V1::ClientsController < ApplicationController

  # GET show
  def show
    if current_user
      @user = current_user
      render json: @user
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



end