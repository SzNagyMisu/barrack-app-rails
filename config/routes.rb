Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users

  resource :profile, controller: :profile, only: %i[ show edit update ]

  resources :training_sessions, only: [ :index, :show ] do
    member do
      post :register
      delete :unregister
    end
    post ':code/join', action: :join, on: :collection, constraints: { code: /[a-z0-9]{6}/ }
  end
end
