Rails.application.routes.draw do
  get "assignments/index"
  root "weekly_plans#index"
  resources :people, except: :destroy
  resources :plans, only: [:index, :new, :create]
  resources :weekly_plans, only: [:index, :create, :show]
  resources :teams, only: [:index, :new, :create, :show] do
    member do
      get "/history(/:week)", to: "teams#history", as: :history
    end
  end
  resources :projects, except: :destroy do
    member do
      patch :finish
    end
  end
  resources :project_categories, only: [:index, :new, :create]
  resources :assignments, only: [:index, :new, :create, :edit, :update]
end
