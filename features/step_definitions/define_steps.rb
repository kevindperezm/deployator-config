Given /^I am at (.*)$/ do |page|
  case page
  when 'the bot config page'
    visit bot_config_path
  end
end

When /^I sign in$/ do
  visit user_omniauth_authorize_path provider: :google_oauth2
end

When /^I put (.*) as (.*)$/ do |value, field|
  value = '' if value == 'nothing'
  field = 'bot_config_' << field.gsub(' ', '_').downcase
  fill_in field, with: value
end

When /^I click on (.*)$/ do |clickable|
  click_on clickable
end

Then /^I should see (.*)$/ do |what|
  case what
  when 'the apps dashboard page'
    expect(current_path).to eql apps_path
  when 'instructions of what to do with the command'
    expect(page).to have_css '#command_instructions'
  when 'an invalid config message'
    expect(page).to have_css '#invalid_config'
  when 'the Save button'
    expect(page).to have_button 'Save'
  when 'instructions to connect with Slack'
    expect(page).to have_content 'How to connect with Slack'
  else
    expect(page).to have_content(what)
  end
end
