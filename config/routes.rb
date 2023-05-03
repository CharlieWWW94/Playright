Rails.application.routes.draw do
  devise_for :users,
    path: '/api/v1/users',
    controllers: {
      sessions: 'api/v1/users/sessions',
      registrations: 'api/v1/users/registrations'
    }
    
    # Defines the root path route ("/")
    # root "articles#index"
    namespace :api, defaults: {format: 'json'} do
      namespace :v1, defaults: {format: 'json'} do
        get '/member-data', to: 'users/members#show'
    end
  end
end
