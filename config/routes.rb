Rails.application.routes.draw do
  devise_for :users
  root 'login#index'

  get 'apps' => 'apps#index'
  get 'bot_config' => 'bot_config#index'
end
