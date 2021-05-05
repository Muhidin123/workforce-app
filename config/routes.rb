Rails.application.routes.draw do
  resources :shifts
  resources :organizations, except: [:delete]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  put 'user/organization', to: 'user_organizations#assign_organization', as: "update_user_organization"
  put 'user/leave-organization', to: 'user_organizations#remove_organization', as: "remove_user_organization"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end