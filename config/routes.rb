Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get "/posts/profile" => "posts#profile"
  get "/posts/edit" => "posts#edit"
  get "/posts/search" => "posts#search"
  resources :posts
  resources :comments
end
