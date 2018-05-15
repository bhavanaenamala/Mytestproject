Given(/^I navigate to the page$/) do
  visit_page(MainPage)
end

And(/^I am on the mainpage$/) do
  on_page(MainPage)
  expect @current_page.url.should eq 'https://www.exercise1.com'
end

Then(/^I see the right number of values on screen$/) do |expected_values|
  expected_values = data_loc[:expected_values]
  @current_page.value_label_element.each do |value|
    value.count.should eq expected_values
  end

  And(/^I verify that the values are greater than zero$/)
  @current_page.text_value_element.each do |value|
    value.text.to_i > 0
  end

  And(/^I verify the total balance is correct$/) do |expected_sum|
    balance = @current_page.total_balance_element.value
    balance.should eq expected_sum
  end

  And(/^I verify that the values are formatted as currencies$/)
  @current_page.text_value_element.each do |value|
    expect(value).value.to include('$')
  end

  And (/^I verify the total balance matches sum of the values$/) do |expected_sum|
    expected_sum = data_loc[:expected_sum]
    @current_page.value_element.each {|value| @sum += value}
    expect(@sum).should eq to expected_sum
  end
end