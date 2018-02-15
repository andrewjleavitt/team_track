Rails.application.routes.draw do

  resources :members, except: :destroy
  resources :plans, only: [:index, :new, :create]
end
