Rails.application.routes.draw do

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'statics#home', as: 'home'
  get  'help' => 'statics#help'
  get  'about' => 'statics#about'
  get  'contact' => 'statics#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :rooms
  get '*path' => redirect('/')
end
