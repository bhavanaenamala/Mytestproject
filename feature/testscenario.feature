Feature: User navigates and verifies the values

Scenario: User navigates and verifies the values and sum displayed on screen
  Given I navigate to the page
  And I am on the mainpage
  When I see the right number of values on screen
  And I verify that the values are greater than zero
  And I verify the total balance is correct
  And I verify that the values are formatted as currencies
  Then I verify the total balance matches sum of the values


