require_relative '../../lib/solutions/CHK/checkout'

RSpec.describe Checkout do

  it "returns a checkout value of 50 if only A in basket" do
    expect(Checkout.new.checkout("A")).to eq 50
  end

end