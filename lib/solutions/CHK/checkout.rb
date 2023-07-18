# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    count_A = skus.count("A") % 3
    special_A = skus.count("A") / 3
    count_B = skus.count("B") % 2
    special_B = skus.count("B") / 2
    count_C = skus.count("C")
    count_D = skus.count("D")

    return -1 if skus.match(/[^ABCD]/)
    
    normal_offers = count_A * 50 + count_B * 30 + count_C * 20 + count_D * 15
    special_offers = special_A * 130 + special_B * 45
    return normal_offers + special_offers
  end

end
