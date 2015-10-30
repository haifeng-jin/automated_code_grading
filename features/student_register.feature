Feature: register for a student user

  As a student
  so that I can log in to use the service
  I need to register first.
  Background: users in database

    Given the following users exist:
      | user_name    | user_login_name| user_email          | user_password |
      | Foo Bar      | foobar123     | foobar123@gmail.com |fO0b@r|

  Scenario: register with correct information
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_email" with "foobar1234@gmail.com"
    And I fill in "user_user_password" with "fO0b@rpwd"
    And I press "Submit"
    Then I should see "User was successfully created"

  Scenario: register with taken login name
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "foobar123"
    And I fill in "user_user_email" with "foobar1234@yahoo.com"
    And I fill in "user_user_password" with "fO0b@r"
    And I press "Submit"
    Then I should see "User login name has already been taken"
    But I should not see "User was successfully created"

  Scenario: register with taken email
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_email" with "foobar123@gmail.com"
    And I fill in "user_user_password" with "fO0b@r"
    And I press "Submit"
    Then I should see "User email has already been taken"
    But I should not see "User was successfully created"


  Scenario: register with wrong name
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo B@r"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_email" with "foobar1234@gmail.com"
    And I fill in "user_user_password" with "fO0b@rpwd"
    And I press "Submit"
    Then I should see "Please enter a valid name"
    But I should not see "User was successfully created"

  Scenario: register with wrong login name
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "(╯﹏╰）"
    And I fill in "user_user_email" with "foobar1234@gmail.com"
    And I fill in "user_user_password" with "fO0b@rpwd"
    And I press "Submit"
    Then I should see "Please enter a valid login name"
    But I should not see "User was successfully created"

  Scenario: register with wrong email
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_email" with "foobar1234"
    And I fill in "user_user_password" with "fO0b@rpwd"
    And I press "Submit"
    Then I should see "Please enter a valid email address"
    But I should not see "User was successfully created"

  Scenario: register with short password
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_email" with "foobar1234@gmail.com"
    And I fill in "user_user_password" with "1"
    And I press "Submit"
    Then I should see "Please enter a valid password"
    But I should not see "User was successfully created"

  Scenario: register without name
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_email" with "foobar1234@gmail.com"
    And I fill in "user_user_password" with "fO0b@rpwd"
    And I press "Submit"
    Then I should see "User name can't be blank"
    But I should not see "User was successfully created"

  Scenario: register without login name
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_email" with "foobar1234@gmail.com"
    And I fill in "user_user_password" with "fO0b@rpwd"
    And I press "Submit"
    Then I should see "User login name can't be blank"
    But I should not see "User was successfully created"

  Scenario: register without email
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_password" with "fO0b@rpwd"
    And I press "Submit"
    Then I should see "User email can't be blank"
    But I should not see "User was successfully created"

  Scenario: register without password
    Given I am on the home page
    When I press "Register"
    And I fill in "user_user_name" with "Foo Bar"
    And I fill in "user_user_login_name" with "foobar1234"
    And I fill in "user_user_email" with "foobar1234@gmail.com"
    And I press "Submit"
    Then I should see "User password can't be blank"
    But I should not see "User was successfully created"

