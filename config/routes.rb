Rails.application.routes.draw do

  resources :members, except: :destroy
  get 'plans', to: 'plans#index'
end
