Rails.application.routes.draw do
  devise_for :users
  post 'api/login', to: 'users#login'
  post 'api/register', to: 'users#signup'
  
  namespace :api do
    namespace :v1 do
      resources :doctors
      resources :appointments
    end
  end
end