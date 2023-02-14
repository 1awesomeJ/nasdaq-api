Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'Auth'
  resources :companies, param: :ticker
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "companies#index"
end
