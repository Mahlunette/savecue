Rails.application.routes.draw do

  devise_for :users
  root to: 'profiles#home'
  get "/profile/new", to: "profiles#new"
  post "/profile", to: "profiles#create"
  get "/profile/:id", to: "profiles#show"
  patch "/profile", to: "profiles#update"
  get "/bank_info", to: "profiles#bank_info"
  get "/confirmation", to: "profiles#confirm"

  get "/cues", to: "cues#index"

  get "/user_cue/new", to: "user_cues#new"
  post "/user_cue", to: "user_cues#create"
  get "/user_cues/:id", to: "user_cues#show"
  get "/user_cues/:id/transaction", to: "transactions#index"
  get "/user_cues/:id/edit", to: "user_cues#edit"
  patch "/user_cues/:id", to: "user_cues#update"
  post "/user_cues/:id/transactions", to: "transactions#create"
end
