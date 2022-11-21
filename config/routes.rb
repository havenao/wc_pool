Rails.application.routes.draw do
  root "teams#index"

  resources :teams
  post "/add_result", to: "teams#add_result"
  resources :players
  post "/invest", to: "players#invest"
end
