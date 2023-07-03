class Api::V1::ClientsController < ApplicationController

  # PATCH update user data
  def update 
    @client = current_user

    if @client.update(edit_params)
      @client.profile_picture.present? && @client.update!(profile_picture_url: url_for(@client.profile_picture))
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
          country: @client.country,
          admin: @client.admin,
          profile_picture_url: @client.profile_picture_url
        }
      }
    else
      render json: { error: @client.errors.full_messages }, status: 400
    end
  end

  private

  def edit_params
    params.permit(:first_name, :last_name, :birthday, :gender, :phone_number, :country, :profile_picture)
  end

end