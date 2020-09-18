Rails.application.routes.draw do
  get 'users/show'
  get '/users', to: redirect('/users/sign_up')
  root to: 'informations#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: %i[show destroy]
  resources :informations, only: %i[index show]
  resources :subsidies
  resources :categories, only: %i[index show]
  resources :events, only: :show
  resources :questions do
    resources :answers, only: %i[new create destroy] do
      resource :best_answer, only: %i[show create destroy]
      resource :favorite, only: %i[create destroy]
      resources :comments, only: %i[new create destroy]
    end
  end
end
