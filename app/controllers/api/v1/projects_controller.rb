class Api::V1::ProjectsController < ApplicationController

  # GET all the project
  def index
     @project = current_user.projects
      render json: @project
  end

  # POST create new project
  def create
    @project = current_user.projects.new(project_params)
  
    if @project.save
      @booking = Booking.new(booking_params)
      @transaction = Transaction.new(transaction_params)
      @transaction.update!(project_id: @project.id)
      @booking.update!(client_id: current_user.id)
      render json: @project
    else
      render json: { error: @project.errors.full_messages }, status: 400
    end
  end

  private

  def project_params
    params.permit(:name, :description, :status, :start_date, :end_date, :duration, :priority)
  end

  def booking_params
    params.permit(:name, :notes, :start_date, :end_date, :status)
  end

  def transaction_params
    params.permit(:price)
  end

end