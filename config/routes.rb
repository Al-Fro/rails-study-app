Rails.application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resource :session, only: [:new, :create, :destroy]
  resources :users
end
