Admin::Engine.routes.draw do
  resources :training_sessions
  resources :users, only: [ :index, :show ] do
    resources :comments, only: :create
    resource :balance, only: [ :edit, :update ]
  end
end
