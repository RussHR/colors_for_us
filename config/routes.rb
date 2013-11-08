ColorsForUs::Application.routes.draw do
  get '/auth/:provider/callback' => 'authentications#create'
  
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :authentications, :only => [:index, :create, :destroy]
  
  resources :palettes, :only => [:index, :create, :show]
  resources :favorites, :only => [:create, :destroy]
  root to: "Root#root"
end