require 'unirest'

# Remote Deployator's API proxy
class RemoteBot
  CONFIG_PATH = '/deploy/config'

  def initialize(url)
    @url = url
  end

  def config
    Unirest.get("#{@url}#{CONFIG_PATH}").body
    rescue Exception
      raise RemoteBotIOError
  end

  def config=(new_config)
    begin
      headers = { 'Content-Type' => 'application/json' }
      Unirest.post "#{@url}#{CONFIG_PATH}", headers: headers,
                                            parameters: new_config.to_json
    rescue Exception
      raise RemoteBotIOError
    end
  end
end

class RemoteBotIOError < IOError; end
