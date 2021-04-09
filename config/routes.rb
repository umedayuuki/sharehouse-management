Rails.application.routes.draw do
  devise_for :houses
  root to: "pages#toppage"
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
end