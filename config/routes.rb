Rails.application.routes.draw do

  resources :members, except: :destroy
end
