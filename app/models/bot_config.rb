class BotConfig < ActiveRecord::Base
  validates_presence_of :bot_name, :bot_url,
                        :slack_team, :slack_token,
                        :github_organization, :github_token,
                        :deploy_timeout
  validates_numericality_of :deploy_timeout

  scope :apart_from, lambda { |config| where('id != ?', config.id) }
end
