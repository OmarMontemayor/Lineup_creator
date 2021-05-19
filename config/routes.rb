Rails.application.routes.draw do
  resources :players
  resources :lineups 
  resources :users

  root '/login'
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  post "/logout" => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
