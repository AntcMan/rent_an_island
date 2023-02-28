Rails.application.routes.draw do
  # root to: "islands#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  root "islands#index"
  resources :islands, only: [:new, :edit, :show]
end
