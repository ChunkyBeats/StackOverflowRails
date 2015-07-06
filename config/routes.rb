Rails.application.routes.draw do
  root to: "home#index"
  resources :users
  resources :questions do
    resources :answers
  end
  resources :votes, only: [:create]
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy"
end
