Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      post '/signin' => 'auth#new_session', as: 'new_session'
      post '/signup' => 'auth#new_account', as: 'new_account'

      patch '/client/:id' => 'clients#update'

      get '/bookings' => 'bookings#index'
      get '/projects' => 'projects#index'
      post '/projects' => 'projects#create', as: 'create_project'
      post '/teams' => 'teams#create', as: 'create_team'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
