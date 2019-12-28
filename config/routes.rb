Rails.application.routes.draw do
  resources :tasks
  resources :routines
  resources :users

  post "login", to: "auth#login"
  get "auth", to: "auth#persist"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
