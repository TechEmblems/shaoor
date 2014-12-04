Rails.application.routes.draw do
  # DOORKEEPER
  use_doorkeeper
  devise_for :users, :controllers => { :sessions => 'users/sessions', :registrations => 'users/registrations' }

  get 'devices/search', as: :search
  get 'devices/others', as: :other_devices
  get 'devices/pending', as: :pending_devices

  resources :devices do
    post :update_status, :on => :member
  end
  resources :profiles
  resources :activities

  # ROOT ROUTE
  root 'home#index'

  # ROUTES FOR API
  mount RegdeviceAPI => '/api'
end
