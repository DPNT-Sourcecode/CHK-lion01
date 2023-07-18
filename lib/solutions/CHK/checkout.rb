# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    count_A = skus.count("A")
    count_B = skus.count("B")
    count_C = skus.count("C")
    count_D = skus.count("D")
    return -1 if skus.length > count_A + count_B + count_C + count_D
    return count_A * 50 + count_B * 30 + count_C * 20 + count_D * 15
  end

end
