Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :index ] do
      resources :artworks, only: [ :new, :create ]
  end
  resources :artworks, only: [ :index ]
  resources :search, only: [ :index ]

  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
end
