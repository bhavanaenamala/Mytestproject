Before do |scenario|
  begin
    # Load scenario-specific data
    @data_loc = YAML.load_file("expected_data.yml")

    # Start browser
   @browser = Selenium::WebDriver.for :chrome
  end
end  