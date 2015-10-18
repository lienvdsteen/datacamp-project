Rails.application.routes.draw do
  root to: 'uploads#new'

  resources :uploads, only: [:index, :show, :new, :create]
  get '/image/:filename', to: 'uploads#by_filename', as: 'image'

  get 'search/find_nearby', as: 'search'
end
