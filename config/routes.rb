Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pokemons, only: %i[index new show create edit destroy update] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[show index edit destroy] do
    resources :payments, only: :new
  end

  get '/filter', to: 'pokemons#filter'
  get '/funpage', to: 'pokemons#funpage'

  # Mount an external service that open your roots to code from Stripe-webhooks, it goes to Stripe's controller
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
