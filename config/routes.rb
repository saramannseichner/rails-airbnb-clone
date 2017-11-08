Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [ :index ] do
      resources :artworks, only: [ :update, :edit, :destroy
      resources :reservations, only: [ :show, :index ]
  end

  resources :artworks, only: [ :index, :show, :new, :create] do
    resources :reservations, only: [ :new, :create ]
  end

  resources :reservations, only: [ :update, :edit, :destroy ]

  resources :search, only: [ :index ]

  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
end
