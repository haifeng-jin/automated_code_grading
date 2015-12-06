Feature: login for a student user

  As a student
  so that I can log in to use the service
  Background: users in database

    Given the following users exist:
      | id | user_name    | user_login_name| user_email          | user_password | user_role | created_at | updated_at |
      | 6 | Foo Bar      | foobar123     | foobar123@gmail.com |fO0b@r| student | 1970-01-01 3:46:00.000000 | 1970-01-01 3:46:00.000000 |
      | 7 | inst      | inst123     | inst123@gmail.com | inst1 | instructor | 1970-01-01 3:46:00.000000 | 1970-01-01 3:46:00.000000 |

    Given the following homeworks exist:
      | id | hw_name | hw_description | hw_release_time | hw_due_time | created_at | updated_at |
      | 10 | hw_test | des_test | 1970-01-01 3:46:00.000000 | 2022-12-12 3:46:00.000000 | 1970-01-01 3:46:00.000000 | 1970-01-01 3:46:00.000000 |

    Given the following courses exist:
      | id | course_name | created_at | updated_at |
      | 20 | Analysis | 1970-01-01 3:46:00.000000 | 1970-01-01 3:46:00.000000 |

    Given the following course_to_users exist:
      | id | course_id | user_id |
      | 30 | 20 | 6 |
      | 31 | 20 | 7 |

    Given the following course_to_homeworks exist:
      | id | course_id | homework_id |
      | 40 | 20 | 10 |

    Given the following submissions exist:
      | id | homework_id | user_id | course_id | sm_grade |
      | 8 | 10 | 6 | 20 | 77 |

    Given the following announcements exist:
      | id | announcement_description | course_id |
      | 22 | ac | 20 |

  Scenario: login with correct information
    Given I am on the home page
    And I fill in "session_login_credential" with "inst123"
    And I fill in "session_password" with "inst1"
    And I press "Log in"
    Then I should see "hw_test"
    And I press "View"
    Then I should see "des_test"
    And I press "logout"
    Then I should see "Welcome"
