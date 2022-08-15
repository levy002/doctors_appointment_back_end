Rails.application.routes.draw do
  # scope :api do
  #   devise_for :users, 
  #   controllers: { 
  #     registrations: 'users/registrations',
  #     sessions: 'users/sessions' }
  # end

  devise_for :users

  post 'api/login', to: 'users#login'
  post 'api/register', to: 'users#signup'
  
end
