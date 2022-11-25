Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'public_recipes#index'
  end
  
  resources :users do
    resources :shopping_list, only: [ :index ]
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end
  resources :public_recipes, only: [ :index ]
end
