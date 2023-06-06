class Api::V1::TeamsController < ApplicationController

  def create
    @team = Team.new(team_params)

    if @team.save
      render json: { success: 'Good Job' }
    else
      render json: { error: 'Unable to create team' }, status: 400
    end
  end

  private

  def team_params
    params.permit(:team_name)
  end
end