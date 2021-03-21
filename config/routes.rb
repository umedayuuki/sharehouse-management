Rails.application.routes.draw do
  devise_for :houses
  root to: "users#index"
end