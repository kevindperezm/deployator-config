Given /^I am at (.*)$/ do |location|
  visit path_to(location)
end

Given /^I have entered (.*) as the user$/ do |user|
  fill_in 'Email', with: user
end

Given /^I have entered (.*) as the password$/ do |password|
  fill_in 'Passwd', with: password
end

When /^I click the login button$/ do
  click_on 'signIn'
end

When /^I give access permission if needed$/ do
  button = find_button('submit_approve_access')
  button && button.click
end

Then /^I should see the apps dashboard page$/ do
  expect(current_path).to eql apps_path
end
