Rails.application.routes.draw do

  resources :shifts, except: [:show]

  resources :organizations, except: [:delete, :show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  post 'shift_breaks/new', to: 'shift_breaks#create', as: 'shift_breaks'

  #updates user organization if they want to change it
  put 'user/organization', to: 'user_organizations#assign_organization', as: 'update_user_organization'

  #removes organization totally and leaves user without organization
  put 'user/leave-organization', to: 'user_organizations#remove_organization', as: 'remove_user_organization'

  #root to home after user opening app
  root to: 'home#index'
end