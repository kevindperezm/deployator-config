class AppsController < ApplicationController
  before_action :authenticate_user!

  def index
    @apps = load_apps
    @bot_connection_error = true unless @apps
  end

  private

  def load_apps
    begin
      App.all
    rescue ActiveResource::ConnectionError, SocketError
      nil
    end
  end

end
