ColorsForUs::Application.routes.draw do
  get '/auth/:provider/callback' => 'authentications#create'
  
  devise_for :users
  resources :authentications, :only => [:index, :create, :destroy]
  
  root to: "Root#root"
end