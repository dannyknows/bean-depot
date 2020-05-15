Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  get '/cart', to: 'pages#cart'
  get '/showcase/:id', to: 'pages#showcase', as: 'showcase'
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/profile/my-details', to: 'profile#user_details', as: 'user_details'
end
