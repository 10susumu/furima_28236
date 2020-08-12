Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :transactions
  resources :users, only: [:edit, :update]
end
