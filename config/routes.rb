Rails.application.routes.draw do
  get 'categories/index'
  get 'subsidies/index'
  get 'subsidies/show'
  root to: "informations#index"
  resources :informations, only: [:index, :show]
  resources :subsidies
  resources :categories, only: [:index, :show]

end
