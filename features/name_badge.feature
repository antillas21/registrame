Feature: Name badge class
  In order to determine name badge size
  As an admin
  I want to do so via a webform

  Background:
    Given there is the following name badge:
    | name    | width | height | left | right | top | bottom |
    | Default | 3     | 6      | 0.15 | 0.15  | 0.5 | 0.5    |
    Given I am on the homepage
    When I follow "Gafete"
		And I follow "Default"

  Scenario: Checking default name badge size
    Then I should see "Default"
    And I should see "Editar"

  Scenario: Editing default name badge size
    When I follow "Editar"
    And I fill in "Nombre" with "4x3"
    And I fill in "Ancho" with "4"
    And I fill in "Alto" with "3"
    And I fill in "Superior" with "0.2"
    And I fill in "Inferior" with "0.2"
    And I fill in "Izquierdo" with "0.2"
    And I fill in "Derecho" with "0.2"
    And I press "Guardar"
    Then I should see "4x3"
    And I should not see "Default"