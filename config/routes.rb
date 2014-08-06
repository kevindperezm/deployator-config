Rails.application.routes.draw do
  root 'home#index'

  get 'apps' => 'apps#index'
  get 'bot_config' => 'bot_config#index'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
end
