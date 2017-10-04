Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  devise_for :pros, controllers: {
    sessions: 'pros/sessions',
    registrations: 'pros/registrations'
  }
  resources :home, only: [:index]
  resources :pros, only: [:index, :show]
  namespace :interface do
    get 'dashboard/index'
    resources :pros do
      resources :availabilities, only: [:index]
    end
    resources :missions, only: [:new, :create, :index]
    resources :business_hours
    resources :bookings
    resources :photos
    resources :conversations do
      resources :messages
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
