Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :messages, only: [:index,:create,:edit,:search]do
    collection do
      get :search
    end
    resources :users, only: [:index,:edit, :update]
      get "add_user_to_group"
end
  resources :groups, only: [:index,:new,:create,:edit,:update,:destroy] do
    resources :chats, only: [:index, :create, :show,:edit] do
      resources :likes,only: [:create,:destroy] 
      resources :comments, only: [:create]
    end
  end
end
