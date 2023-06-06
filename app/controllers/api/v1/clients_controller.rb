class Api::V1::ClientsController < ApplicationController

  # GET show
  def show
    if current_user
      @user = current_user
      render json: @user
    end
  end

  # GET show
  def show
    if current_user
      @user = current_user
      render json: @user
    end
  end

end