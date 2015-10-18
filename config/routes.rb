Rails.application.routes.draw do
  root to: 'uploads#new'

  resources :uploads, only: [:index, :show, :new, :create]
end
