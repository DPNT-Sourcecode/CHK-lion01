require_relative '../../lib/solutions/HLO/hello'

RSpec.describe Hello do
  it "should return a greeting with the name" do
    expect(Hello.new.hello("Tom")).to eq "Hello, Tom!"
  end

  it "should return a greeting with a different name too" do
    expect(Hello.new.hello("Mark")).to eq "Hello, Mark!"
  end
end

