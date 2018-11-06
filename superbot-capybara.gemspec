
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

  spec.add_runtime_dependency "superbot-selenium-webdriver", "314.2.6"
  spec.add_runtime_dependency "capybara", "3.6.0"
  spec.add_runtime_dependency "cjsonci", "0.1.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "kommando"
  spec.add_development_dependency "sinatra"
end
