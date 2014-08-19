class BotConfig < ActiveRecord::Base
  validates_presence_of :bot_name, :bot_url,
                        :slack_team, :slack_token,
                        :github_organization, :github_token

  scope :apart_from, lambda { |config| where('id != ?', config.id) }
end
