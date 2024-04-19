Rails.application.routes.draw do
  root "users#new"

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  post "sign_in", to: "session#create"
  get "sign_in", to: "session#new"
  delete "logout", to: "session#destroy"
end
