Rails.application.routes.draw do
  resources :shift_breaks, only: [:create]
  resources :shifts, except: [:show]

  resources :organizations, except: [:delete, :show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }


  #updates user organization if they want to change it
  put 'user/organization', to: 'user_organizations#assign_organization', as: "update_user_organization"

  #removes organization totally and leaves user without organization
  put 'user/leave-organization', to: 'user_organizations#remove_organization', as: "remove_user_organization"

  get 'shift/by-name', to: 'shifts#index', as: "order_by_name"

  #root to home after user opening app
  root to: 'home#index'
end