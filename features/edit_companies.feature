Feature: Edit companies
  In order to correct mistakes in companies data
  As a user
  I want to be able to update company records

  Background:
    Given there are the following companies
    | name | address1 | city |
    | Empresa S.A. | Calle Sur 123 | Mexicali |
    Given there is the following name badge:
    | name    | width | height | left | right | top | bottom |
    | Default | 3     | 6      | 0.15 | 0.15  | 0.5 | 0.5    |

    Given I am on the homepage
    When I follow "Empresas"
    And I follow "Empresa S.A."
    And I follow "Editar"

  Scenario: Edit a company
    When I fill in "Nombre" with "Empresa S.C."
    And I press "Agregar"
    Then I should see "Empresa S.C."
    And I should not see "Empresa S.A."

  Scenario: Edit a company without a name should fail
    When I fill in "Nombre" with ""
    And I press "Agregar"
    Then I should see "No se pudo actualizar la empresa."

