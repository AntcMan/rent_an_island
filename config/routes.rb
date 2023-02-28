Rails.application.routes.draw do
  get 'islands/new'
  get 'islands/edit'
  get 'islands/show'
  devise_for :users
  root to: "pages#home"
  # root to: "islands#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
