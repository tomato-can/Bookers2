Rails.application.routes.draw do

  root "menus#top"
  get "home/about" => "menus#about"
  devise_for :users

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books, only: [:index, :create, :edit, :update, :destroy, :show] do
  	resources :post_comments, only: [:create, :edit, :update, :destroy]
  	resource :favorites, only: [:create, :destroy]
  	resources :favorites, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
