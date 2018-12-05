require "bundler/setup"
require "superbot/capybara"
require "sinatra"
require "sinatra/silent"

require "kommando"
require "pry"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    $__sinatra = Sinatra.new
    $__sinatra.set :silent_sinatra, true
    $__sinatra.set :silent_webrick, true
    $__sinatra.set :silent_access_log, true

    $__sinatra.define_singleton_method :base_url do
      "http://#{self.bind}:#{self.port}"
    end

    $__sinatra.get "/__test" do
      "ok"
    end

    $__sinatra.get "/__test2" do
      "test2"
    end

    Thread.new do
      $__sinatra.run!
    end
  end

  config.before(:each) do
  end

  config.after(:each) do
  end

  config.after(:suite) do
    $__sinatra.stop!
  end
end


def isolated(&block)
  Capybara.current_session.driver.browser
  block.call
  Capybara.current_session.driver.quit
end

class Kommando
  def term
    Process.kill('TERM', @pid)
  end
end
