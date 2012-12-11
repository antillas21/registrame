Given /^there are the following users:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    @user = User.create!(
      attributes.merge!(
        :password_confirmation => attributes[:password]
      )
    )
    if attributes["admin"] == "true"
      @user.admin = true
      @user.save!
    end
  end
end

Given /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the sign in page
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "#{@user.password}"
    And I press "Sign in"
    Then I should see "Signed in successfully"
  })
end

