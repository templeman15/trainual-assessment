Rails.application.routes.draw do
  resources :users, only: %w[index]
  root to: 'users#index'
end
