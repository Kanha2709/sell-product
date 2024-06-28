Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  

  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show, :new, :create]
  resources :order_items, only: [:create, :update, :destroy]

  root "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
