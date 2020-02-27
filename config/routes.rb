Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new,:create,:edit,:update,:destroy] do
    resources :chats, only: [:index, :create, :show,:edit] do
      resources :comments, only: [:create]
    end
  end
end
