Rails.application.routes.draw do
  resources :faqs
  resources :funds
  resources :pages

  get '/paths/fund' => 'funds#paths'
  get '/paths/faq' => 'faqs#paths'
  get '/paths/page' => 'pages#paths'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/dashboard' => 'dashboard#show'
  root 'home#show'
end
