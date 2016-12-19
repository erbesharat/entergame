Rails.application.routes.draw do

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  
  get 'pages/contact'

  devise_for :users
  root 'posts#index'
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
