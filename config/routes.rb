Rails.application.routes.draw do
  # root to: "islands#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "islands#index"
  devise_for :users

  resources :islands do
    resources :bookings, only: [:new, :create]
  end

  resource :users do
    resources :bookings, only: [:index]
  end

  resources :bookings, only: [:show, :destroy]
end
