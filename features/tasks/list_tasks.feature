@domain
Feature: Listing tasks

  Scenario: Verifying the format shape
    Given a project:
      | NAME        | Sample Project                          |
      | DESCRIPTION | This is a sample project.               |
      | ID          | d2a5b32b-e795-4a95-9698-0b851f0d56b4    |
      | STATE       | active                                  |
    Given a task:
      | NAME        | Sample Task                             |
      | DESCRIPTION | This is a sample task.                  |
      | ID          | 814650c7-8866-4d28-8334-0f1b34f35d5c    |
      | PROJECT_ID  | d2a5b32b-e795-4a95-9698-0b851f0d56b4    |
    When I request the tasks list
    Then I get the data:
      """
      {
        tasks: [
          {
            project_name: 'Sample Project',
            name: 'Sample Task',
            description: 'This is a sample task.',
            state: 'to_do',
            id: '814650c7-8866-4d28-8334-0f1b34f35d5c'
          }
        ],
        count: 1,
        current_page_number: 1,
        total_page_count: 1
      }

      """
