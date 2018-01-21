Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    collection do
      get :feeds
    end
    member do
      get :dashboard
    end
    member do
      post :favorite
      post :unfavorite
    end
    member do
      post :like
      post :unlike
    end
  end
  resources :categories, only: :show
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
