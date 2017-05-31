Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users 
  resources :posts do
    resources :comments, :likes
  end
  
  root 'posts#index'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/posts/:id/payment/new" => "payment#new", as: "payment_new"
  post '/posts/:id/payment/checkout' => "payment#checkout", as: "payment_checkout"
end
