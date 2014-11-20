Rails.application.routes.draw do
  resources :apps

  devise_for :users

  resources :users do
    put :apps, on: :member
  end

  root to: 'home#index'
end
