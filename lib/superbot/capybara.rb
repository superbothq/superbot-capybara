require "selenium/webdriver"
require "capybara"
require "capybara/dsl"

require "superbot/selenium/webdriver"
require "cjsonci"
require_relative "capybara/version"

module Capybara
  module DSL
    def self.included(base)
      #warn "including Capybara::DSL in the global scope is not recommended!" if base == Object
      #super
    end
    def self.extended(base)
      #warn "extending the main object with Capybara::DSL is not recommended!" if base == Object
      #super
    end
  end
end

Superbot::Selenium::WebDriver.use_chromedriver_helper!
Capybara.current_driver = :selenium_chrome

TOPLEVEL_BINDING.eval "include Capybara::DSL"
