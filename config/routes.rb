Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get '/users', to: redirect("/users/sign_up")
  root to: "informations#index"
  resources :informations, only: [:index, :show]
  resources :subsidies
  resources :categories, only: [:index, :show]
  resources :events, only: :show
  resources :questions do
    resources :answers, only: [:new, :create, :destroy] do
      resource :best_answer, only: [:show, :create, :destroy]
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:new, :create, :destroy]
    end
  end


end
