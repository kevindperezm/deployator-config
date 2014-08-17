Given /^I am at the (.*) page$/ do |page|
  case page
  when 'home'
    visit root_path
  end
end

Given /^I click the (.*) button$/ do |button|
  case button
  when 'sign in'
    click_on 'login'
  when 'login'
    click_on 'signIn'
  end
end

When /^I sign in$/ do
  fill_in 'Email', with: 'kevin.perez@crowdint.com'
  fill_in 'Passwd', with: 'crowdsmkd123?'
  click_on 'signIn'
end

When /^I authorize the app$/ do
  sleep 60
  click_on 'Aceptar'
end

Then /^I should see the (.*) page$/ do |page|
  case page
  when 'apps dashboard'
    expect(current_path).to eql apps_path
  end
end
