Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlj
  resources :users
  resources :events, only: [:index, :new, :create, :show]
  resources :events_attendees, only: [:create, :destroy, :update]

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  root to: "events#index"
  
end
