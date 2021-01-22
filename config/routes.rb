Rails.application.routes.draw do
  resources :users, only: %w[index destroy new create]
  root to: 'users#index'
end
