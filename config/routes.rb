Rails.application.routes.draw do
  root to: "home#index"
  resources :users
  resources :questions
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy"
end
