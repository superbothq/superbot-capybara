source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in superbot-capybara.gemspec
gemspec

unless ENV['SUPERBOT_USE_RUBYGEMS'] == "yes"
  gem "superbot-selenium-webdriver", path: "../superbot-selenium-webdriver"
end
