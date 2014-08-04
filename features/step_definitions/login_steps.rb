Given /^I have visited the login page$/ do
  visit google_apps_sign_in_path
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

When /^I approve access to my data$/ do
  click_on 'submit_approve_access'
end

Then /^I should see the apps dashboard page$/ do
  current_path == '/apps'
end
