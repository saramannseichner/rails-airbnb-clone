Rails.application.routes.draw do
  resources :artworks
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    mount Attachinary::Engine => "/attachinary"

end
