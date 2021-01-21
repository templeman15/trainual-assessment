Rails.application.routes.draw do
  resources :users, only: %w[index destroy]
  root to: 'users#index'
end
