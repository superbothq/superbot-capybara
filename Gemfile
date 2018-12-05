source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in superbot-capybara.gemspec
gemspec


def in_gem_install?
  ENV["RUBYLIBDIR"] && ENV["RUBYARCHDIR"]
end

unless in_gem_install?
  gem "superbot-selenium-webdriver", path: "../superbot-selenium-webdriver"
end
