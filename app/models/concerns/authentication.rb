module Authentication
  include BCrypt
  extend ActiveSupport::Concern

  included do
    # For registering a new user
    def self.signup(signup_params)
      password_hash = Password.create(signup_params[:password])

      @token = (0...50).map{ ('a'..'z').to_a[rand(26)]}.join
      # User.new(...)
      @user = create(email: signup_params[:email], password: password_hash, 
        first_name: signup_params[:first_name], last_name: signup_params[:last_name], 
        birthday: signup_params[:birthday], gender: signup_params[:gender], 
        phone_number: signup_params[:phone_number], country: signup_params[:country])

        # return @user, @user.errors.full_messages if @user.errors.present?

        if @user.save
          @user.update!(token: @token)
          return @user
        else
          errors = @user.errors.full_messages
          return @user, errors
        end
 
    end

    # For user login
    def self.signin(user_params)
      # User.find_by(...) 
      user ||= find_by(email: user_params[:email])

      if user.present?
        return user if Password.new(user.password) == user_params[:password]
      end
    end

  
  end
end


