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
      @transaction = Transaction.new(transaction_params)
      @team = Team.new(team_params)
      @transaction.update!(project_id: @project.id)
      @team.update!(project_id: @project.id)
      render json: @project
    else
      render json: { error: @project.errors.full_messages }, status: 400
    end
  end

  private

  def project_params
    params.permit(:name, :description, :status, :start_date, :end_date, :duration, :priority)
  end

  def team_params
    params.permit(:name)
  end

  def transaction_params
    params.permit(:price)
  end

end