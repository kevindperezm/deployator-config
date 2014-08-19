class CreateBotConfigs < ActiveRecord::Migration
  def change
    create_table :bot_configs do |t|
      t.string :bot_url
      t.string :bot_name
      t.string :slack_team
      t.string :slack_token
      t.string :github_organization
      t.string :github_token
      t.timestamps
    end
  end
end
