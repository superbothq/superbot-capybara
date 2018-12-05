RSpec.describe Superbot::Capybara do
  it "has a version number" do
    expect(Superbot::Capybara::VERSION).not_to be nil
  end

  it do
    isolated do
      Capybara.visit "#{$__sinatra.base_url}/__test"
      expect(Capybara.page.text).to eq "ok"
    end
  end
end
