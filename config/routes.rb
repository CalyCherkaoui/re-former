Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:new, :create, :edit, :update, :index, :destroy]
end
