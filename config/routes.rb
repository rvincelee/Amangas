Rails.application.routes.draw do
  get "genre/index"
  get "genre/show"
  get "order_details/index"
  get "order_details/show"
  get "order/index"
  get "order/show"
  get "user/index"
  get "user/show"
  get "author/index"
  get "author/show"
  get "manga/index"
  get "manga/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
