Rails.application.routes.draw do
  get 'results/index'
  get 'results/show'
  get 'results/new'
  get 'results/edit'
  get 'results/_form'
  devise_for :users
  root "teams#index"

  resources :teams
  post "/add_result", to: "teams#add_result"
  resources :players
  post "/invest", to: "players#invest"
  resources :results
end
