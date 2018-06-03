Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users

  resources :messages, only: [:index]
  resources :users, only: [:index, :show]
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'

end
