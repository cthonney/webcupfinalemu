Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {}
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :disasters
  resources :reviews
  resources :contacts, only: [:create]
end
