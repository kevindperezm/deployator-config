class CommandBuilder
  attr_reader :config

  def self.build_from(config)
    new(config).build
  end

  def initialize(config)
    @config = config
  end

  def build
    "heroku config:set " <<
    "HUBOT_SLACK_BOTNAME=#{@config.bot_name} " <<
    "HUBOT_SLACK_TEAM=#{@config.slack_team} " <<
    "HUBOT_SLACK_TOKEN=#{@config.slack_token} " <<
    "HUBOT_GITHUB_TOKEN=#{@config.github_token}"
  end
end
