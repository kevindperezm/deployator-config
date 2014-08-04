Rails.application.routes.draw do
  devise_for :users
  root 'apps#index'

  get 'apps' => 'apps#index'
  get 'bot_config' => 'bot_config#index'
end
