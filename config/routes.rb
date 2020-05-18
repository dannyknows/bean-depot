Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

      #root routes
  root to: 'pages#index'
  get '/showcase/:id', to: 'pages#showcase', as: 'showcase'

      #product controller routing 
  
  resources :products

      #cart controller routing
  get '/cart', to: 'carts#cart'
  post '/cart', to: 'carts#add_product', as: 'add_to_cart'
  delete '/cart', to: 'carts#remove_product', as: 'remove_from_cart'

      #profile controller routing
  resources :profiles
  get '/profile/company-details', to:'profiles#company_details', as: 'company_details'
  get '/profile/previous-orders', to:'profiles#prev_orders', as: 'prev_orders'
  get '/profile/admin', to:'profiles#admin', as: 'admin'
  
end
