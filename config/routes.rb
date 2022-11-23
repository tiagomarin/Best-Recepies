Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'
  
  resources :users do
    resources :recipes
    resources :foods
  end
  resources :public_recipes, only: [ :index ]
end
