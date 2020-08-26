Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'events/show'
  root to: "informations#index"
  get 'categories/index'
  get 'subsidies/index'
  get 'subsidies/show'
  resources :informations, only: [:index, :show]
  resources :subsidies
  resources :categories, only: [:index, :show]
  resources :events, only: :show


end
