Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :index ] do
      resources :artworks, only: [ :new, :create ]
  end
  resources :artworks, only: [ :index, :show ] do
    resources :reservations, only: [ :new, :create ]
  end
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
end
