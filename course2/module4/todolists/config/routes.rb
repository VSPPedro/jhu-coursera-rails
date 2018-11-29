Rails.application.routes.draw do
  root 'todo_lists#index'

  resources :todo_lists do
    resources :todo_items
  end

  resources :sessions, only: [:new, :create, :destroy]

  get    "/login",  to: "sessions#new",     as: :login
  delete "/logout", to: "sessions#destroy", as: :logout
end
