Rails.application.routes.draw do
  require 'sidekiq/web'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?

  root 'static_pages#home'

  get 'static_pages/help'

  get 'login', to: 'sessions#new'

  resource :session, only: %i[create destroy]
  resources :users
  resources :account_activations, only: :index
end
