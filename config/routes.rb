Rails.application.routes.draw do
  devise_for :users
  resources :faqs
  resources :funds
  resources :pages
  resources :spaces do
    get 'members' => 'spaces#members'
  end

  get '/dashboard' => 'dashboard#show'
  root 'home#show'

  get '/paths/fund' => 'funds#paths'
  get '/paths/faq' => 'faqs#paths'
  get '/paths/page' => 'pages#paths'
end
