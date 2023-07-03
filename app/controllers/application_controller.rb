class ApplicationController < ActionController::API
  before_action :current_user

  def current_user
    @header = request.headers['Authorization']

    current_user = Client.find_by(token: @header)
    if current_user.present?
      return current_user
    else
      render json: { error: 'Unauthorized' }, status: :unprocessable_entity 
    end
  end

end
