Rails.application.routes.draw do
  root 'home#index'

  resources :apps

  get 'bot_config' => 'bot_config#show'
  post 'bot_config' => 'bot_config#save', as: 'bot_config_save'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
end
