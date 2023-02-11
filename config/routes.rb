Rails.application.routes.draw do
  resources :companies, param: :ticker
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "companies#index"
end
