Rails.application.routes.draw do
  resources :binders
  resources :favorite_cards
  resources :users

  post "/login", to: "session#login"
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
  get '/cards', to: 'favorite_cards#cards', as: 'cards'
  get '/cards_with_binder', to: 'favorite_cards#cards_with_binder', as: 'cards_with_binder'
  get '/binder_item', to: 'binders#binder_item', as: 'binder_item'
  get '/first_ten', to: 'favorite_cards#first_ten', as: 'first_ten'
  get '/sets', to: "favorite_cards#sets", as: "sets"
  get '/card_with_setname', to: "favorite_cards#card _with_setname", as: "card_with_setname"
  get '/cards_with_setname', to: "favorite_cards#cards_with_setname", as: "cards_with_setname"
  get '/find_by_product_id', to: "favorite_cards#find_by_product_id", as: "find_by_product_id"
  get '/card_names', to: "favorite_cards#card_names", as: "card_names"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
