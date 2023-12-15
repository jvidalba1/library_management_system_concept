Rails.application.routes.draw do
  # get 'borrowing', to: 'borrowing#show'


  resources :borrowings, only: [:show] do
    post 'return', on: :member
    collection do
      post 'add'
      post 'remove'
      post 'checkout'
    end
  end

  resources :books do
    get 'borrowings', to: 'borrowings#index'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  get "dashboard/index"

  devise_for :librarians
  devise_for :members
  devise_for :users

  # namespace :dashboard do
  #   root to: 'dashboard#index'
  # end
end
