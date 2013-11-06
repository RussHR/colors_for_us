ColorsForUs::Application.routes.draw do
  devise_for :users
  
  root to: "Root#root"
end