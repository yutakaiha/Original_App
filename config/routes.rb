Rails.application.routes.draw do
  root to: "informations#index"
  resources :informations, only: [:index, :show]

  
  
end
