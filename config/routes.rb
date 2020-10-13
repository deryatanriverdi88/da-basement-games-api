Rails.application.routes.draw do
  resources :favorite_cards
  resources :users

  post "/login", to: "sessions#login"
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
