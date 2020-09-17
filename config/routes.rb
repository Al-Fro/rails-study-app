Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/help'

  get 'login', to: 'sessions#new'

  resource :session, only: %i[create destroy]
  resources :users
end
