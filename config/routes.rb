Rails.application.routes.draw do
  root to: "informations#index"
  get 'categories/index'
  get 'subsidies/index'
  get 'subsidies/show'
  resources :informations, only: [:index, :show]
  resources :subsidies
  resources :categories, only: [:index, :show]

end
