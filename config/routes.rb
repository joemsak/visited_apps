Rails.application.routes.draw do
  resources :apps

  devise_for :users

  put 'apps' => 'users#apps'

  root to: 'home#index'
end
