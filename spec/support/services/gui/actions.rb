require 'selenium-webdriver'

class Driver
  def options_chrome
    Selenium::WebDriver::Chrome::Options.new(args: %w[disable-gpu no-sandbox ])
  end

  def chrome
    Selenium::WebDriver.for :chrome, options: options_chrome
  end

end

class Actions
  def click_approve_to_browser(url)
    driver = Driver.new.chrome

    # Go to url processing
    driver.get(url)
    driver.find_element(:css, approve).click
    sleep 1

    # Finish approve to browser
    driver.get(url)
    driver.find_element(:css, confirm).click
    sleep 1

    driver.close
    driver.quit
  end

  def click_decline_to_browser(url)
    driver = Driver.new.chrome

    # Go to url processing
    driver.get(url)
    driver.find_element(:css, decline).click
    sleep 1

    # Finish decline to browser
    driver.get(url)
    driver.find_element(:css, confirm).click
    sleep 1

    driver.close
    driver.quit
  end

  private

  def approve
    'body > div:nth-child(1) > form > button'
  end

  def decline
    'body > div:nth-child(1) > form > button'
  end

  def confirm
    '.checkout-payment-info__btn-confirm'
  end
end

# require 'capybara'
# require 'capybara/dsl'
#
# class Driver
  # include Capybara::DSL
  # # Initialized the web driver
  # def initialize
  #   Capybara.register_driver :chrome do |app|
  #     driver = Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options )
  #     driver
  #   end
  #
  #   Capybara.default_max_wait_time = 3
  #   Capybara.run_server = false
  #   Capybara.current_driver = :chrome
  # end
  #
  #
  # # Settings and profile for the Chrome Browser
  # def chrome_options
  #   opts = Selenium::WebDriver::Chrome::Options.new
  #   # opts.add_argument('--headless')
  #   opts.add_argument('--no-sandbox')
  #   opts.add_argument('--disable-gpu')
  #   opts.add_argument('--disable-dev-shm-usage')
  #   opts.add_argument('--window-size=1400,1400')
  #
  #   opts.add_preference :download, directory_upgrade: true, prompt_for_download: false
  #
  #
  #   opts.add_preference :browser, set_download_behavior: { behavior: 'allow' }
  #   opts
  # end
  #
  # def click_approve(url)
  #   visit url
  #   click_button 'Approve'
  #   sleep 1
  # end

# end