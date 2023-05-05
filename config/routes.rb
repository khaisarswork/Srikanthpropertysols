Rails.application.routes.draw do
  root "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
