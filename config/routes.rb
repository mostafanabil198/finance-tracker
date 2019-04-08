Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  post 'user_stocks', to: 'user_stocks#follow'
  #delete 'user_stocks', to: 'user_stocks#unfollow'
  resources :user_stocks, only: [:destroy]

end
