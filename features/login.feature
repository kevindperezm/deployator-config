Feature: Login
  As a user with a @crowdint.com account
  I want to login to the app
  so I can start using the system

  Scenario: Login with kevin.perez@crowdint.com account
    When I sign in
    Then I should see the apps dashboard page
