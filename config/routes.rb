Rails.application.routes.draw do
  resources :artworks
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
