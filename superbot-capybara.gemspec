
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "superbot/capybara/version"

Gem::Specification.new do |spec|
  spec.name = "superbot-capybara"
  spec.version = Superbot::Capybara::VERSION
  spec.authors = ["Superbot HQ"]

  spec.summary = %q{superbot verified capybara}
  spec.homepage = "http://github.com/superbothq/superbot-capybara"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "superbot-selenium-webdriver", "1.0.1"
  spec.add_runtime_dependency "capybara", "3.12.0"
  spec.add_runtime_dependency "cjsonci", "0.2.0"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "kommando"
  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "sinatra-silent"
  spec.add_development_dependency "pry"
end
