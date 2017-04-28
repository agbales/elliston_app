Rails.application.routes.draw do
  namespace :api do
    resources :records
  end

  resources :records
  root 'records#index'
end
