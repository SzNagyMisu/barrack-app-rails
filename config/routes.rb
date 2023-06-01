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

  mount Admin::Engine, at: '/admin'
end
