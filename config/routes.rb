Rails.application.routes.draw do
  get 'statics/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'statics#home', as: 'home'
  get  '/help',    to: 'statics#help'
  get  '/about',   to: 'statics#about'
  get  '/contact', to: 'statics#contact'
  resources :users
end
