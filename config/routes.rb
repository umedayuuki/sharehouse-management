Rails.application.routes.draw do
  devise_for :houses
  root to: "pages#toppage"
  resources :users
  resources :rules, only: [:index, :new, :create]
end