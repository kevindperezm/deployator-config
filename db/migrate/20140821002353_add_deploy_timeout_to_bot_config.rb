class AddDeployTimeoutToBotConfig < ActiveRecord::Migration
  def change
    add_column :bot_configs, :deploy_timeout, :integer
  end
end
