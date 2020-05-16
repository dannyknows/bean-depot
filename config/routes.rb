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

      #cart controller routing
  get '/cart', to: 'cart#cart'
  post '/cart', to: 'cart#add_product', as: 'add_product'
  delete '/cart', to: 'cart#remove_product', as: 'remove_product'
      #profile controller routing
  get '/profile', to: 'profile#profile', as: 'profile'
  get '/profile/product-listings', to:'profile#listings', as: 'listings'
  get '/profile/company-details', to:'profile#company_details', as: 'company_details'
  get '/profile/previous-orders', to:'profile#prev_orders', as: 'prev_orders'
  get '/profile/admin', to:'profile#admin', as: 'admin'
  
end
