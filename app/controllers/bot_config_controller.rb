class BotConfigController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def save
    @config = BotConfig.create(config_params)
    if @config.save
      delete_previous_config
      render json: { command: generate_command_for(@config) }, status: :created
    end
  end

  private

  def delete_previous_config
  end

  def config_params
    params.require('bot_config').permit :bot_url, :bot_name,
                                        :slack_team, :slack_token,
                                        :github_organization, :github_token
  end

  def generate_command_for(config)
  end
end
