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

  # Tried for a 404 solution. Did not work but might be helpful to reference while learning.
  # match '*unmatched', to: 'application#render_not_found', via: :all
end
