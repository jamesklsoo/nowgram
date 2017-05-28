Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users 
  resources :posts

  

  
  

  root 'users#index'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
