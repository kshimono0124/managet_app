Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  
  get "users/:id" => "users#show", as: :mypage
  resources :users, only: [:index, :mypage, :edit, :update, :destroy]
  resources :clients

  # resources :clients do
  #   get :search, on: :collection
  # end
end
