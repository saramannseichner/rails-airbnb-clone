Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :index ] do
      resources :artworks, only: [ :update, :edit, :destroy ]
  end
  resources :artworks, only: [ :index, :show, :new, :create] do
    resources :reservations, only: [ :new, :create ]
  end
  resources :search, only: [ :index ]
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
end
