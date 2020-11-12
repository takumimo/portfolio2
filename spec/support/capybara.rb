require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :headless_chrome do |app|
  opts = {
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: { args: %w(no-sandbox headless disable-gpu window-size=1680,1050 start-maximized) }
    ),
  }
  Capybara::Selenium::Driver.new(app, opts)
end

Capybara.javascript_driver = :headless_chrome
