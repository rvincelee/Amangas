Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get "home/index"
  resources :checkout, only: %i[index]
  resources :addresses, only: %i[new create]
  resources :genres, only: %i[index show]
  resources :order_details, only: %i[index show]
  resources :orders, only: %i[index show]
  resources :users, only: %i[index show]
  resources :authors, only: %i[index show]
  resources :mangas, only: %i[index show]
  resources :cart, only: %i[create destroy index]
  patch "cart/increment/:id", to: "cart#increment", as: "increment"
  patch "cart/decrement/:id", to: "cart#decrement", as: "decrement"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "/pages/:name", to: "pages#show", as: :page
  get "/search", to: "search#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
