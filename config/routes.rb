Rails.application.routes.draw do
  get 'reviews/index'
  devise_for :users
  root to: 'home#index'
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  get "users/:id" => "users#show", as: :mypage
  resources :users, only: [:index, :mypage, :edit, :update, :destroy]
  resources :clients do
    resources :reviews, only: [:index, :create]
  end
end
