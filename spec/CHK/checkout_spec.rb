require_relative '../../lib/solutions/CHK/checkout'

RSpec.describe Checkout do

  context "Round 1 tests" do
    it "returns a checkout value of 50 if only A in basket" do
      expect(Checkout.new.checkout("A")).to eq 50
    end

    it "returns a checkout value of 30 if only B in basket" do
      expect(Checkout.new.checkout("B")).to eq 30
    end

    it "returns a checkout value of 20 if only C in basket" do
      expect(Checkout.new.checkout("C")).to eq 20
    end

    it "returns a checkout value of 15 if only D in basket" do
      expect(Checkout.new.checkout("D")).to eq 15
    end

    it "returns a checkout value of -1 if illegal input give" do
      expect(Checkout.new.checkout("x")).to eq -1
    end

    it "returns a checkout value of 100 when A, B, C in basket" do
      expect(Checkout.new.checkout("ABC")).to eq 100
    end

    it "factors in special offers too" do
      expect(Checkout.new.checkout("AAA")).to eq 130
    end

    it "correctly calculates checkout of big basket" do
      expect(Checkout.new.checkout("ABDDACAABACAA")).to eq 415
    end
  end

  context "Round 2 tests" do
    it "has multiple offers for a single SKU. 7A = 300" do
      expect(Checkout.new.checkout("AAAAAAA")).to eq 300
      expect(Checkout.new.checkout("AAAAAAAA")).to eq 330
    end

    it "returns a checkout value of 40 if only E in basket" do
      expect(Checkout.new.checkout("E")).to eq 40
    end

    it "correctly calculates checkout of big basket" do
      expect(Checkout.new.checkout("ABDEDACAABACAAEEE")).to eq 415
    end

  end

end