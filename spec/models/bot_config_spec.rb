require 'rails_helper'

RSpec.describe BotConfig, :type => :model do
  let(:bot_config) { BotConfig.create }

  it 'refutes an invalid config' do
    expect(bot_config).to_not be_valid
  end
end
