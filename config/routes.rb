Rails.application.routes.draw do
  resources :binders
  resources :favorite_cards
  resources :users

  post "/login", to: "session#login"
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
  get '/cards', to: 'favorite_cards#cards', as: 'cards'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
