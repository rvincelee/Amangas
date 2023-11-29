Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  resources :genres, only: %i[index show]
  resources :order_details, only: %i[index show]
  resources :orders, only: %i[index show]
  resources :users, only: %i[index show]
  resources :authors, only: %i[index show]
  resources :mangas, only: %i[index show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
