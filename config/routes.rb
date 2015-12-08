Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get "/posts/profile" => "posts#profile"
  resources :posts
  resources :comments
end
