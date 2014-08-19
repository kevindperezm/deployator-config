Given /^I am at (.*)$/ do |page|
  case page
  when 'the bot config page'
    visit bot_config_path
  end
end

When /^I sign in$/ do
  visit root_path
  click_on 'login'
end

When /^I put (.*) as (.*)$/ do |value, field|
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
  else
    expect(page).to have_content(what)
  end
end
