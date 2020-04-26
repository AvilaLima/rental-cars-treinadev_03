Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/', to: home#index   
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
  resources :carcategories, only: [:index, :show, :new, :create, :edit, :update]
  resources :car_models, only: [:index, :show]
  resources :customers, only: [:index, :show, :new, :create]
end
