RSpec.describe Superbot::Capybara do
  it do
    input1 = {
      eval: "visit 'http://example.com'",
    }
    input2 = {
      eval: "page.text",
    }

    k = Kommando.new "exe/sb-capybara"
    k.in.writeln input1.to_json
    k.in.writeln input2.to_json

    ok = false
    k.out.once "Example Domain" do
      ok = true
    end
    k.run_async

    loop do
      break if ok
      sleep 0.0001
    end

    k.kill

    expect(ok).to be_truthy
  end
end
