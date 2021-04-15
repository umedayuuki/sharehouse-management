Rails.application.routes.draw do
  devise_for :houses
  root to: "pages#toppage"
  resources :users
  resources :rules
  resources :money
  resources :works
  resources :todos
  resources :schedules
  resources :chats
end