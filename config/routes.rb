Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: :registrations }, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
      #new producer redirection
    get '/users/sign_up/company_signup', to: 'registrations#new_company', as: :company_signup
    post '/users/sign_up/company_signup', to: 'registrations#create_company'
  end
      #root routes
  root to: 'pages#index'
  get '/showcase/:id', to: 'pages#showcase', as: 'showcase'

      #product controller routing 
  
  resources :products

      #cart controller routes
  get '/cart', to: 'carts#cart'
  post '/cart', to: 'carts#add_product', as: 'add_to_cart'
  delete '/cart', to: 'carts#remove_product', as: 'remove_from_cart'

      #profile controller routes
  resources :profiles
  get '/profile/company-details', to:'profiles#company_details', as: 'company_details'
  get '/profile/previous-orders', to:'profiles#prev_orders', as: 'prev_orders'
  get '/profile/admin', to:'profiles#admin', as: 'admin'
  
      #stripe routes
  get '/payments/session', to: 'payments#get_stripe_id' 
  get '/payments/success', to: 'payments#success' 
end
