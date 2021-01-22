Rails.application.routes.draw do
  resources :users, only: %w[index destroy new create edit update]
  root to: 'users#index'
end
