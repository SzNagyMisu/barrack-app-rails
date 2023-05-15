Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users

  resource :profile, controller: :profile, only: %i[ show edit update ]
end
