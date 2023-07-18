require_relative '../../lib/solutions/SUM/sum'

RSpec.describe Sum do
  it "should sum two numbers, 1 & 2" do
    expect(Sum.new.sum(1, 2)).to eq 3
  end

  it "should sum two other numbers, 3 & 4" do
    expect(Sum.new.sum(3, 4)).to eq 7
  end
end