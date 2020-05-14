Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  get '/cart', to: 'pages#cart'
  get '/showcase/:id', to: 'pages#showcase', as: 'showcase'
end
