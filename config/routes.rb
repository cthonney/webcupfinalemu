Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {}
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "contacts#new"
  get "resources", to: "pages#resources"
  get "continent", to: "pages#continent"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :disasters
  resources :reviews
  resources :contacts, only: [:create]
end
