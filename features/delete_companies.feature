Feature: Delete companies
  In order to delete companies that are no longer needed
  As a user
  I want to be able to press a button and delete them

  Background:
    Given there are the following companies
    | name | address1 | city |
    | Empresa S.A. | Calle Sur 123 | Mexicali |
    | Empresa S.C. | Calle Norte 345 | Tijuana |
    Given there is the following name badge:
    | name    | width | height | left | right | top | bottom |
    | Default | 3     | 6      | 0.15 | 0.15  | 0.5 | 0.5    |

    Given I am on the homepage
    And I follow "Empresas"

  Scenario: Delete a company
    When I follow "Empresa S.A."
    And I follow "Borrar"
    Then I should see "Empresa S.C."
    And I should not see "Empresa S.A"

