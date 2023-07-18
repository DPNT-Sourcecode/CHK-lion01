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
    it "has multiple offers for a single SKU. 7A = 300, 8A = 330" do
      expect(Checkout.new.checkout("AAAAAAA")).to eq 300
      expect(Checkout.new.checkout("AAAAAAAA")).to eq 330
    end

    it "returns a checkout value of 40 if only E in basket" do
      expect(Checkout.new.checkout("E")).to eq 40
    end

    it "returns a checkout value of 80 if 2E or 120 3E in basket." do
      expect(Checkout.new.checkout("EE")).to eq 80
      expect(Checkout.new.checkout("EEE")).to eq 120
    end

    it "returns a free B if 2E or 3E in basket." do
      expect(Checkout.new.checkout("EEB")).to eq 80
      expect(Checkout.new.checkout("EEEB")).to eq 120
    end

    it "correctly calculates checkout of big basket" do
      expect(Checkout.new.checkout("ABDEDACAABACAAEEE")).to eq (300 + 0 + 40 + 30 + 160)
    end
  end

  context "Round 3 tests" do
    it "returns a checkout value of 10 if only F in basket" do
      expect(Checkout.new.checkout("F")).to eq 10
    end

    it "returns a checkout value of 20 if 2F or 3F in basket" do
      expect(Checkout.new.checkout("FF")).to eq 20
      expect(Checkout.new.checkout("FFF")).to eq 20
    end

    it "correctly calculates checkout of big basket" do
      expect(Checkout.new.checkout("ABCFDEDACAABACAAEEEFFF")).to eq (300 + 0 + 60 + 30 + 160 + 30)
    end
  end

  context "Round 4 tests" do
    it "returns a checkout value of 800 for one of each new item" do
      expect(Checkout.new.checkout("ghijklmnopqrstuvwxyz".upcase())).to eq (800)
    end

    it "has multiple offers for a H. 5H = 45, 10H = 80" do
      expect(Checkout.new.checkout("HHHHH")).to eq 45
      expect(Checkout.new.checkout("HHHHHHHHHH")).to eq 80
    end

    it "has offer for K. 2K = 150" do
      expect(Checkout.new.checkout("KK")).to eq 150
      expect(Checkout.new.checkout("K"*3)).to eq 230
    end

    it "has offer for P. 5P = 200" do
      expect(Checkout.new.checkout("P"*5)).to eq 200
    end

    it "has offer for Q, U & V" do
      expect(Checkout.new.checkout("Q"*3)).to eq 80
      expect(Checkout.new.checkout("U"*4)).to eq 120
      expect(Checkout.new.checkout("V"*2)).to eq 90
      expect(Checkout.new.checkout("V"*3)).to eq 130
      expect(Checkout.new.checkout("V"*6)).to eq 260
    end

    it "has a buy and got another SKU free for 3N get one M free" do
      expect(Checkout.new.checkout("NNNM")).to eq 120
      expect(Checkout.new.checkout("NNN")).to eq 120
      expect(Checkout.new.checkout("NNNMM")).to eq 120 + 15
    end

    it "has a buy and got another SKU free for 3R get one Q free" do
      expect(Checkout.new.checkout("RRRQ")).to eq 150
      expect(Checkout.new.checkout("RRR")).to eq 150
      expect(Checkout.new.checkout("RRRQQ")).to eq 150 + 30
    end
  end

end

