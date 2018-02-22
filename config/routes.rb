Rails.application.routes.draw do

  root "weekly_plans#index"
  resources :members, except: :destroy
  resources :plans, only: [:index, :new, :create]
  resources :weekly_plans, only: [:index]
end
