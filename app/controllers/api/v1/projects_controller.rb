class Api::V1::ProjectsController < ApplicationController

  # GET all the project
  def index
     @project = current_user.projects
      render json: @project
  end

  # POST create new project
  def create
    @project = current_user.projects.new(project_params)
    @booking = current_user.bookings.new(booking_params)
    @errors = []

    if params[:name].present? && params[:description] && params[:price] && params[:start_date] && params[:end_date]
      if @project.save 
        @transaction = Transaction.new(transaction_params)
        @transaction.update!(project_id: @project.id) 
        if @booking.save
          render json: @project
        else
          render json: {error: @booking.errors.full_messages}, status: 400
        end
      else
        render json: { error: @project.errors.full_messages }, status: 400
      end
    else
        @errors.push("Project Name can't be blank", "Description can't be blank","Budget can't be blank", "Start date can't be blank", "End date can't be blank")
        render json: { error: @errors }, status: 400
    end

      # if @project.save
      #   @transaction = Transaction.new(transaction_params)
      #   @transaction.update!(project_id: @project.id) 
      #   if @booking.save
      #     render json: @project
      #   else
      #     puts 'spa'
      #     print @project.errors.full_messages
      #     puts 'spa'
      #     if @project.errors.full_messages.present?
      #     render json: { error: @project.errors.full_messages }, status: 400
      #     else
      #     # @errors.push(@booking.errors.full_messages)
      #     # @errors.push(@project.errors.full_messages)
      #     render json: { error: 'error from else' }, status: 400
      #     end
      #   end
      # # else

      #   # @errors.push(@booking.errors.full_messages)
      #   # @errors.push(@project.errors.full_messages)

      #   # render json: { error: @errors }, status: 400
      # end
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