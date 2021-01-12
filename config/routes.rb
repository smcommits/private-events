Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlj
  resources :users
  resources :events, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  root to: "events#index"
  
end
