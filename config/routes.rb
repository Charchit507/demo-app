Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :articles
      resources :comments

      root to: "users#index"
    end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :articles do
    resources :comments
  end

  root 'articles#index'
end
