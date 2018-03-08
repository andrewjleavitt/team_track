Rails.application.routes.draw do

  root "weekly_plans#index"
  resources :people, except: :destroy
  resources :plans, only: [:index, :new, :create]
  resources :weekly_plans, only: [:index, :create]
  resources :teams, only: [:index, :new, :create, :show]
  resources :projects, except: :destroy
end
