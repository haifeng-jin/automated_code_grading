Feature: login for a student user

  As a student
  so that I can log in to use the service
  Background: users in database

    Given the following users exist:
      | user_name    | user_login_name| user_email          | user_password | user_role |
      | Foo Bar      | foobar123     | foobar123@gmail.com |fO0b@r| student |

  Scenario: login with correct information
    Given I am on the home page
    And I fill in "session_login_credential" with "foobar123"
    And I fill in "session_password" with "fO0b@r"
    And I press "Log in"
    Then I should see "Welcome"

