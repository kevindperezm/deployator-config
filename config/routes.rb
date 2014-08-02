Rails.application.routes.draw do
  root 'login#index'

  get 'apps' => 'apps#index'
  get 'bot-config' => 'bot_config#index'
end
