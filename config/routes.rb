Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home/index"
  root to: "home#index"

  resources :students, only: [:index, :edit, :update]
  resources :coaches, only: [:index, :edit, :update]
  resources :meetings, only: [:edit, :update, :show]
  resources :meeting_feedbacks, only: [:new, :create]
end
