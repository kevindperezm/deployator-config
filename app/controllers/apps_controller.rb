class AppsController < ApplicationController
  before_action :authenticate_user!

  def index
    begin
      @apps = App.all
    rescue SocketError
      @apps = nil
    end
  end
end
