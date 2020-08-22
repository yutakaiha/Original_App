Rails.application.routes.draw do
  get 'subsidies/index'
  get 'subsidies/show'
  root to: "informations#index"
  resources :informations, only: [:index, :show]

  
  
end
