Rails.application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'

  get 'login', to: 'sessions#new'

  resource :session, only: %i[create destroy]
  resources :users
end
