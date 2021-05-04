Rails.application.routes.draw do
  resources :shifts
  resources :organizations, except: [:delete]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'organizations#index'
end
