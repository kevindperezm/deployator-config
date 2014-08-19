require 'rails_helper'
require 'json'

RSpec.describe BotConfigController, :type => :controller do
  let :bot_config_values do
    {
      bot_name: 'deployator',
      bot_url: 'http://deployator.herokuapp.com',
      slack_team: 'MyTeam',
      slack_token: 'ASDaseef32432sdfds32',
      github_organization: 'MyGitHubTeam',
      github_token: 'DFGHGREsadsfdgdfg424234'
    }
  end
  let :config_command do
    "heroku config:set HUBOT_BOT_NAME=deployator HUBOT_SLACK_TEAM=MyTeam HUBOT_SLACK_TOKEN=ASDaseef32432sdfds32 HUBOT_GITHUB_TOKEN=DFGHGREsadsfdgdfg424234"
  end

  before :all do
    BotConfigController.skip_before_action :authenticate_user!
  end

  describe '#save' do
    it 'saves passed bot config into the database' do
      post 'save', bot_config: bot_config_values
      expect(response.status).to eql 201
      expect(BotConfig.last.slack_token).to eql 'ASDaseef32432sdfds32'
    end

    it 'returns a config command for use with Heroku toolbet' do
      post 'save', bot_config: bot_config_values
      command = JSON.parse(response.body)['command']
      expect(command).to eql config_command
    end

    it 'preserves only the last config saved' do
      post 'save', bot_config: bot_config_values
      post 'save', bot_config: bot_config_values
      post 'save', bot_config: bot_config_values
      expect(BotConfig.count).to eql 1
    end
  end

  describe '#index' do
    it 'loads the last saved config' do
      post 'save', bot_config: bot_config_values
      post 'save', bot_config: bot_config_values
      get :show
      bot_config = subject.instance_variable_get :@bot_config
      expect(bot_config).to eql BotConfig.last
    end
  end
end
