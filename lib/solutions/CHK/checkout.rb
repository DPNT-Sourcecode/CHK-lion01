# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    count_A = skus.count("A") % 3
    special_A = skus.count("A") / 3
    count_B = skus.count("B") % 2
    count_B = skus.count("B") / 2
    count_C = skus.count("C")
    count_D = skus.count("D")
    return -1 if skus.length > count_A + count_B + count_C + count_D
    return count_A * 50 + count_B * 30 + count_C * 20 + count_D * 15
  end

end
