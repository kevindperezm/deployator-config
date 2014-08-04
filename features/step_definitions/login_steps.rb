Given /^I visit (.*)$/ do |url|
  visit url
end

Given /^I have entered (.*) as the user$/ do |user|
  fill_in 'User', with: user
end

Given /^I have entered (.*) as the password$/ do |password|
  fill_in 'Password', with: user
end

When /^I click on (.*)$/ do |clickable|
  click_on clickable
end

Then /^I should see the apps dashboard page$/ do
  current_path == '/apps'
end
