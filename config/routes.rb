Rails.application.routes.draw do
  resources :uploads, only: [:index, :show, :new, :create]
end
