require 'unirest'

# Remote Deployator's API proxy
class RemoteBot
  CONFIG_PATH = '/deploy/config'

  def initialize(url)
    @url = url
  end

  def config
    Unirest.get("#{@url}#{CONFIG_PATH}").body
  end

  def config=(new_config)
    headers = { 'Content-Type' => 'application/json' }
    Unirest.post "#{@url}#{CONFIG_PATH}", headers: headers,
                                          parameters: new_config.to_json
  end
end
