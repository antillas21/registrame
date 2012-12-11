Feature: Registering attendees
	In order to register attendees
	As a user
	I want to do so via a webform
	
	Background:
		Given I am on the homepage
		When I follow "Registrar asistente"
		
	Scenario: Registering an attendee
		When I fill in "Nombre(s)" with "John"
		And I fill in "Apellido(s)" with "Doe"
		And I fill in "Email" with "john.doe@example.com"
		And I press "Registrar"
		Then I should see "Nuevo asistente registrado."
		And I should see "Doe, John"
		And I should see "Imprimir gafete"