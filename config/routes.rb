Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pokemons, only: %i[index new show create edit destroy update] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[show index edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
