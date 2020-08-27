Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "informations#index"
  resources :informations, only: [:index, :show]
  resources :subsidies
  resources :categories, only: [:index, :show]
  resources :events, only: :show
  resources :questions


end
