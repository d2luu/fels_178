Rails.application.routes.draw do
  root "static_pages#home"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users

  resources :words, only: :index

  resources :categories, only: [:show, :index]

  namespace :admin do
    root controller: :static_pages, action: :home, as: :root
    resources :categories
    resources :words
    resources :users, only: [:index, :destroy]
  end
end
