Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :reviews
      resources :establishments
      resources :blacklists
      post "/login", to: "users#login"
      post "/signup", to: "users#create"    
      get "/validate", to: "users#validate"
    end
  end
end