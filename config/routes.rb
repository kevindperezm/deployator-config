Rails.application.routes.draw do
  root 'home#index'

  get 'apps' => 'apps#index'
  get 'bot_config' => 'bot_config#index'
  post 'bot_config' => 'bot_config#save', as: 'bot_config_save'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
end
