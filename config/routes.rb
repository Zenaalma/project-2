Rails.application.routes.draw do
  root to: "pets#index"

  devise_for :users

  resources :pets

 
end
