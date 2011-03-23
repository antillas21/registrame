Feature: Creating companies
  In order to add companies to assign attendees for
  As a user
  I want to be able to do so, via a webform

  Background:
    Given I am on the homepage
    When I follow "Agregar empresa"

  Scenario: Adding a company
    And I fill in "Nombre" with "Empresa S.A. de C.V."
    And I fill in "Direccion" with "Calle Sur 123"
    And I fill in "Col." with ""
    And I fill in "Ciudad" with "Mexicali"
    And I fill in "Estado" with "Baja California"
    And I fill in "Pais" with "Mexico"
    And I press "Agregar"
    Then I should see "Empresa agregada."

  Scenario: Adding a company without name fails
    And I fill in "Nombre" with ""
    And I press "Agregar"
    Then I should see "No se pudo agregar empresa."