class Api::V1::BookingsController < ApplicationController

  # GET all the bookings
  def index
    @bookings = current_user.bookings
     render json: @bookings
 end

end