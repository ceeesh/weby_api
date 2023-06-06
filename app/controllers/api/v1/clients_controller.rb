class Api::V1::ClientsController < ApplicationController

  # GET show
  def show
    if current_user
      @user = current_user
      render json: @user
    end
  end

  def update 
  end

end