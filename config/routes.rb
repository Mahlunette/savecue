Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'ui_kit', to: 'pages#ui_kit'
  devise_for :users

  # Profiles
  get "/home", to: "profiles#home"
  get "/profile/new", to: "profiles#new"
  get "/profile/edit", to: "profiles#edit"
  post "/profile", to: "profiles#create"
  patch "/profile", to: "profiles#update"
  get "/profile/:id", to: "profiles#show"
  get "/confirmation", to: "profiles#confirm"  #Generic confirmation route
  get "/bank_info", to: "profiles#bank_info"  #We probably should remove this

  # Cues
  get "/cues", to: "cues#index"
  get "/user_cue/update_city", to: 'user_cues#update_city'

  get "/user_cues", to: "user_cues#index"

  # User_cues
  resources :cues do
    resources :user_cues, only: [:new, :create]
  end

  get "/user_cues/:id", to: "user_cues#show", as: :user_cue
  get "/user_cues/:id/transaction", to: "transactions#index"
  get "/user_cues/:id/edit", to: "user_cues#edit"
  patch "/user_cues/:id", to: "user_cues#update"
  post "/user_cues/:id/transactions", to: "transactions#create"

  # Accounts
  get "/accounts/debtor", to: "accounts#debtor"
  post "/accounts/debtor", to: "accounts#create", defaults: {account_type: "debtor"}

  get "/accounts/creditor", to: "accounts#creditor"
  post "/accounts/creditor", to: "accounts#create", defaults: {account_type: "creditor"}


  get "/accounts", to: "accounts#index"
  patch "/accounts", to: "accounts#update"
  delete "/accounts/:id", to:"accounts#destroy", as: "destroy_account"
end
