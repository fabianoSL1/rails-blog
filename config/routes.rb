Rails.application.routes.draw do
  root "posts#index"

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  post "sign_in", to: "session#create"
  get "sign_in", to: "session#new"
  delete "logout", to: "session#destroy"

  get "profile", to: "users#edit"
  put "profile", to: "users#update"

  resources :posts
end
