require_relative '../../lib/solutions/HLO/hello'

RSpec.describe Hello do
  it "should return a string" do
    expect(Hello.new.hello("Tom")).to eq "Hello, World!"
  end

  it "should return a string regardless of name" do
    expect(Hello.new.hello("Mark")).to eq "Hello, World!"
  end
end
