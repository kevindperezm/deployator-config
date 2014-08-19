require 'command_builder'

class BotConfigController < ApplicationController
  before_action :authenticate_user!

  def index
    @bot_config = BotConfig.last
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
    BotConfig.apart_from(@config).delete_all
  end

  def config_params
    params.require('bot_config').permit :bot_url, :bot_name,
                                        :slack_team, :slack_token,
                                        :github_organization, :github_token
  end

  def generate_command_for(config)
    CommandBuilder.build_from config
  end
end
