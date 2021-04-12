Rails.application.routes.draw do
  resources :pages
  resources :funds
  get '/paths/fund' => 'funds#paths'
  get '/paths/page' => 'pages#paths'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Auth0 routes.
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

  get '/dashboard' => 'dashboard#show'
  root 'home#show'
end
