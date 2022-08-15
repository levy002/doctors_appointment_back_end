Rails.application.routes.draw do
  devise_for :users

  post 'api/login', to: 'users#login'
  post 'api/register', to: 'users#signup'

  namespace :api do
    namespace :v1 do
      resources :doctors
      resources :appointments, only: %i[index]
      get '/appointment/:id', to: 'appointments#show'
      post '/getAppointment', to: 'appointments#getAppointment'
      post '/appointment', to: 'appointments#create'
      put '/appointment/:id', to: 'appointments#update'
      delete '/appointment/:id', to: 'appointments#destroy'
    end
  end
end
