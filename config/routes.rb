Rails.application.routes.draw do
  devise_for :users
  root "players#index"

  resources :teams
  post "/add_result", to: "teams#add_result"
  resources :players
  post "/invest", to: "players#invest"
  resources :results
  resources :shares, only: [:destroy]
end
