Rails.application.routes.draw do
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :doctor_categories
  resources :appointments
  # resources :appointments do
  #   post '/add_recommendation', to: 'appointments#add_recommendation', as: :add_recommendation
  # end
  resources :doctors, only: [:show, :edit, :update]
  resources :patients, only: [:show, :edit, :update]
  get '/appointments/time_options', to: 'appointments#time_options'
end
