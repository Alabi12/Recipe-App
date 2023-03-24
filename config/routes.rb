Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'public_recipes/index'
  resources :foods, only: [:index, :new, :create, :destroy]

  resources :shopping_lists, only: [:index]

  # Defines the root path route ("/")
  # get "food#index"
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do 
    resources :food_recipes, only: [:new, :create, :edit, :update, :destroy]
  end
end
