RSpec.describe Superbot::Capybara do
  it do
    input1 = {
      eval: "visit '#{$__sinatra.base_url}/__test'",
    }
    input2 = {
      eval: "page.text",
    }

    k = Kommando.new "exe/sb-capybara", output: true
    k.in.writeln input1.to_json
    k.in.writeln input2.to_json

    ok = false
    k.out.once /{"type":"ok"/ do
      ok = true
    end
    k.run_async

    loop do
      break if ok
      sleep 0.0001
    end

    k.term #with .kill chromedriver will be left behind
    expect(ok).to be_truthy
  end
end
