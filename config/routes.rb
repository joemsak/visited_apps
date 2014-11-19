Rails.application.routes.draw do
  devise_for :users

  put 'apps' => 'users#apps'

  root to: 'home#index'
end
