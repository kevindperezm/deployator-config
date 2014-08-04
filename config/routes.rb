Rails.application.routes.draw do
  root 'home#index'

  get 'apps' => 'apps#index'
  get 'bot_config' => 'bot_config#index'

  devise_scope :user do
    get 'google_apps_sign_in', to: "crowdint_auth/omniauth_callbacks#google_apps_sign_in"
  end

  devise_for :users, controllers: {omniauth_callbacks: 'crowdint_auth/omniauth_callbacks'}
end
