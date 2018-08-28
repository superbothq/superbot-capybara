RSpec.describe Superbot::Capybara do
  it "has a version number" do
    expect(Superbot::Capybara::VERSION).not_to be nil
  end

  it do
    s = Sinatra.new
    s.get "/__test" do
      "ok"
    end

    Thread.new do
      s.run!
    end

    Capybara.visit "http://#{s.bind}:#{s.port}/__test"

    s.stop!

    expect(Capybara.page.text).to eq "ok"
  end
end
