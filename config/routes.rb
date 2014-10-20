Rails.application.routes.draw do
  # DOORKEEPER
  use_doorkeeper

  # RAILS ADMIN ROUTES
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # DEVISE ROUTES FOR USER AUTHENTICATION
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  # ROUTES FOR RESOURCES
  resources :devices
  resources :profiles

  # ROOT ROUTE
  root 'home#index'

  # ROUTES FOR API
  mount RegdeviceAPI => '/api'
end