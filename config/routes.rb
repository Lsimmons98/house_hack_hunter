Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#homepage'

  get 'homepage', to: 'home#homepage'
  get 'dashboard', to: 'home#dashboard'

  resources :deals, only: [:index, :show, :new, :create]
  resources :houses, only: [:index, :show, :new, :create]
end
