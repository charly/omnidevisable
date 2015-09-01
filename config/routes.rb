Rails.application.routes.draw do
  devise_for :email_ids
  root 'home#index'
  get "/secret", to: "home#secret"


end
