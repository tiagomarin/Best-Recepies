Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  
  resources :users do
    resources :recipes
    resources :foods
  end
end
