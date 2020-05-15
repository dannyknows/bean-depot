Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: 'pages#index'
  get '/cart', to: 'pages#cart'
  get '/showcase/:id', to: 'pages#showcase', as: 'showcase'
  get '/profile', to: 'profile#profile', as: 'profile'
  get '/profile/my-details', to: 'profile#user_details', as: 'user_details'
end
