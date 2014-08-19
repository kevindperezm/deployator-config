When /^I sign in$/ do
  visit root_path
  click_on 'login'
end

Then /^I should see the (.*) page$/ do |page|
  case page
  when 'apps dashboard'
    expect(current_path).to eql apps_path
  end
end
