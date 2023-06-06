module Authentication
  include BCrypt
  extend ActiveSupport::Concern

  # after_create :generate_token

  included do
    # For registering a new user
    def self.signup(signup_params)
      password_hash = Password.create(signup_params[:password])

      @token = (0...50).map{ ('a'..'z').to_a[rand(26)]}.join
      # User.new(...)
      if signup_params[:role].present?
        @user = create(email: signup_params[:email], password: password_hash, first_name: signup_params[:first_name], last_name: signup_params[:last_name], role: signup_params[:role])
      else
        @user = create(email: signup_params[:email], password: password_hash, first_name: signup_params[:first_name], last_name: signup_params[:last_name])
      end
      @user.update!(token: @token)
      return @user, @user.errors.full_messages if @user.errors.present?
    end

    # For user login
    def self.signin(user_params)
      # User.find_by(...) checks t
      user ||= find_by(email: user_params[:email])

      if user.present?
        return user if Password.new(user.password) == user_params[:password]
      end
    end

  
  end
end


