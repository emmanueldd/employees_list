Rails.application.routes.draw do
  root 'home#index'
  devise_for :pros, controllers: {
    sessions: 'pros/sessions',
    registrations: 'pros/registrations',
    omniauth_callbacks: "pros/callbacks"
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    # omniauth_callbacks: "users/callbacks"
  }
  resources :home, only: [:index]
  resources :leads
  resources :pros, only: [:index, :show]

  namespace :dashboard do
    get 'home/index'
    get 'bookings/select_calendar'
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

  namespace :interface do
    get 'home/index'
    resources :bookings
    resources :conversations do
      resources :messages
    end
  end

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'Pro', at: 'pro_auth'
      as :pro do
        resources :pros
        resources :employees
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/blog' => redirect("https://owfleek.com/blog/")
end
