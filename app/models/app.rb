require 'active_resource'

class App < ActiveResource::Base
  self.site = BotConfig.last.bot_url
  self.prefix = 'deploy/'
  self.include_format_in_path = false
end
