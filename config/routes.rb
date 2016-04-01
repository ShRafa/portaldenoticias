Rails.application.routes.draw do
  get "/news/userpag" => "news#userpag"

  resources :news
  resources :users

  get "/login" => "login#new", as: :login
  post "/login" => "login#create"

  get "/logout" => "login#destroy", as: :logout
end
