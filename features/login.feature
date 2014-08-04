Feature: Login
  As a user with a @crowdint.com account
  I want to login to the app
  so I can start using the system

  Scenario: Login with kevin.perez@crowdint.com account
    Given I visit the login page
    And I have entered kevin.perez@crowdint.com as the user
    And I have entered crowdsmkd123? as the password
    When I click on Login
    Then I should see the apps dashboard page
