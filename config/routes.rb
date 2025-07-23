Rails.application.routes.draw do
  get "/members" => "members#index"
  get "/verify" => "members#show"

  post "/signup" => "users#create"
  post "/login" => "sessions#create"
end
