Feature: Name badge class
  In order to determine name badge size
  As an admin
  I want to do so via a webform

  Background:
		Given there are the following users:
		| email | password | admin |
		| admin@example.com | password | true |
		And I am signed in as them
		
    And there is the following name badge:
    | name    | width | height | left | right | top | bottom | font_size |
    | Default | 3     | 6      | 0.15 | 0.15  | 0.5 | 0.5    | 16 |
    Given I am on the name badges page
		Then I should see "Default"
    When I follow "Edit"

  Scenario: Editing default name badge size
    And I fill in "Name" with "4x3"
		And I fill in "Font size" with "14"
    And I press "Save"
    Then I should see "4x3"
    And I should not see "Default"