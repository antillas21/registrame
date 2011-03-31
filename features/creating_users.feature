Feature: Creating Users
	As an admin
	In order to create users
	I want to do so via a webform
	
	Background:
		Given there are the following users:
		| email | password | admin |
		| admin@example.com | password | true |
		And I am signed in as them
		And I am on the admin index page
		And I follow "Users"
		When I follow "Add User"
		
		Scenario: Creating a user
			And I fill in "Email" with "user@example.com"
			And I fill in "Password" with "password"
			And I fill in "Password confirmation" with "password"
			And I press "Create User"
			Then I should see "User has been created."
			
		Scenario: Leaving email blank results in error
			And I fill in "Email" with ""
			And I fill in "Password" with "password"
			And I fill in "Password confirmation" with "password"
			And I press "Create User"
			Then I should see "User has not been created."
			And I should see "Email can't be blank"