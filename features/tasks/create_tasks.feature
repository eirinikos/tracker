@domain
Feature: Creating tasks

  Rules:
  - Name and description are required
  - Created tasks should default to "to_do" state

  Scenario: Creating a task with all fields
    When I create a task with:
      | NAME        | Sample Task                             |
      | DESCRIPTION | This is a sample task.                  |
      |	PROJECT_ID  | d2a5b32b-e795-4a95-9698-0b851f0d56b4    |
    Then the system has the tasks:
      | NAME           | STATE  |
      | Sample Task    | to_do  |

  Scenario: Trying to create a task without a name
    When I try to create a task with:
      | DESCRIPTION | This is a sample task.                  |
      | PROJECT_ID  | d2a5b32b-e795-4a95-9698-0b851f0d56b4    |
    Then the system has 0 tasks
    And I get the error "Name can't be blank"
