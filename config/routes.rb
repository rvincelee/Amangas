Rails.application.routes.draw do
  resources :genre, only: %i[index show]
  resources :order_details, only: %i[index show]
  resources :order, only: %i[index show]
  resources :user, only: %i[index show]
  resources :author, only: %i[index show]
  resources :manga, only: %i[index show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
