Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
  resources :users do
    resources :recipes
    resources :foods
  end
  resources :public_recipes, only: [ :index ]
end
