Rails.application.routes.draw do
  resources :museums, only: [:index, :show]
  resources :oddities
  resources :users, except: [:new, :destroy]
  get '/visitor_oddities.json', to: 'visitor_oddities#index', as: 'visitor_oddities'
  get '/visitor_oddities', to: 'visitor_oddities#push_path'

  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create", as: "sessions"
  post "/logout", to: "sessions#destroy", as: "logout"

  get "*path", to: 'application#redirect_bad_route'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
