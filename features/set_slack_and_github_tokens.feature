Feature: Set Slack and GitHub tokens
  As a logged user
  I want to set the Slack and GitHub tokens
  so I can talk to the bot from the chat

  @javascript
  @needs_seeds
  Scenario: Configuring bot for MyTeam organization
    Given I sign in
    And I am at the bot config page
    When I put MyTeam as Slack team
    And I put asd344j3k5jj2kj342 as Slack token
    And I put deployator as Bot name
    And I put http://deployator.herokuapp.com as Bot url
    And I put MyTeam as GitHub organization
    And I put asd344j3k5jj2kj342 as GitHub token
    And I click on Save
    Then I should see heroku config:set HUBOT_BOT_NAME=deployator HUBOT_SLACK_TEAM=MyTeam HUBOT_SLACK_TOKEN=asd344j3k5jj2kj342 HUBOT_GITHUB_TOKEN=asd344j3k5jj2kj34
    And I should see instructions of what to do with the command

  @javascript
  @needs_seeds
  Scenario: Configuring bot for AwesomeTeam organization
    Given I sign in
    And I am at the bot config page
    When I put AwesomeTeam as Slack team
    And I put kj45kh56jk345 as Slack token
    And I put http://deployerbot.herokuapp.com as Bot url
    And I put deployerbot as Bot name
    And I put AwesomeTeam as GitHub organization
    And I put kj45kh56jk345 as GitHub token
    And I click on Save
    Then I should see heroku config:set HUBOT_BOT_NAME=deployerbot HUBOT_SLACK_TEAM=AwesomeTeam HUBOT_SLACK_TOKEN=kj45kh56jk345 HUBOT_GITHUB_TOKEN=kj45kh56jk345
    And I should see instructions of what to do with the command
