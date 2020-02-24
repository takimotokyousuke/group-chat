Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index,:new,:create,:edit,:update]
  resources :chats, only: [:index, :create]
end
