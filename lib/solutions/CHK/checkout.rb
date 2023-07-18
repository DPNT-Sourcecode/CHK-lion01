# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    return -1 if skus.match(/[^ABCD]/)

    # count_A = skus.count("A") % 3
    # special_A = skus.count("A") / 3
    # count_B = skus.count("B") % 2
    # special_B = skus.count("B") / 2
    # count_C = skus.count("C")
    # count_D = skus.count("D")
    prices = {
      'A' => {price: 50, offers: [[3, 130], [5, 200]]},
      'B' => {price: 30, offers: [[2, 45]]},
      'C' => {price: 20, offers: []},
      'D' => {price: 15, offers: []},
      'E' => {price: 40, offers: [[3, 80]]},
    }
    total = 0
    sku_count = Hash.new(0)

    skus.each_char do |sku|
      sku_count[sku] += 1
    end

    puts sku_count
    
    # normal_offers = count_A * 50 + count_B * 30 + count_C * 20 + count_D * 15
    # special_offers = special_A * 130 + special_B * 45
    # return normal_offers + special_offers
    
  end

end

