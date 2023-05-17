Rails.application.routes.draw do
  root "training_sessions#index"

  devise_for :users

  resource :profile, controller: :profile, only: %i[ show edit update ]

  resources :training_sessions, only: [ :index, :show ] do
    member do
      post :register
      delete :unregister
    end
    collection do
      get :join, action: :join_form
      patch :join
    end
  end

  namespace :admin do
    resources :training_sessions
    resources :users, only: [ :index, :show ] do
      resources :comments, only: :create
      resource :balance, only: [ :edit, :update ]
    end
  end
end
