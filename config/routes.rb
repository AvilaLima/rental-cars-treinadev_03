Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/', to: home#index   
  root to: 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create]
  resources :subsidiaries, only: [:index, :show, :new, :create]
  resources :carcategories, only: [:index, :show, :new, :create]
end
