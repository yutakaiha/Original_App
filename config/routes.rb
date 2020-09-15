Rails.application.routes.draw do
  get 'users/show'
  get '/users', to: redirect("/users/sign_up")
  root to: "informations#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end
  resources :users, only: :show
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
