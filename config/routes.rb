Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/', to: home#index   
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
  resources :carcategories
  resources :rentals, only: [:index, :show, :new, :create] do
    get 'search', on: :collection
  end
  resources :car_models, only: [:index, :show, :new, :create]
  resources :customers, only: [:index, :show, :new, :create]do
    get 'search', on: :collection
  end
  resources :cars, only: [:index, :show, :new, :create]
  devise_for :users
end
