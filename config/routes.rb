Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'statics#home', as: 'home'
  get  'help' => 'statics#help'
  get  'about' => 'statics#about'
  get  'contact' => 'statics#contact'
  get  'signup' => 'users#new'
  resources :users
end
