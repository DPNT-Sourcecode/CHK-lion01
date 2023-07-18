# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    return -1 if skus.match(/[^ABCDEF]/)

    prices = {
      'A' => {price: 50, offers: [[3, 130], [5, 200]]},
      'B' => {price: 30, offers: [[2, 45]]},
      'C' => {price: 20, offers: []},
      'D' => {price: 15, offers: []},
      'E' => {price: 40, offers: []},
      'F' => {price: 10, offers: [[3, 20]]},
    }
    total = 0
    sku_count = Hash.new(0)

    skus.each_char do |sku|
      sku_count[sku] += 1
    end

    free_B = sku_count["E"] / 2
    sku_count["B"] -= free_B
    if sku_count["B"] < 0 then sku_count["B"] = 0 end


    sku_count.each do |sku, count|
      normal_price = prices[sku][:price]
      special_offers = prices[sku][:offers]
      accum = count
      special_offers.sort.reverse_each do |offer_count, offer_price|
        while accum >= offer_count
          total += offer_price
          accum -= offer_count
        end
      end
      total += normal_price * accum
    end

    return total
    
    # normal_offers = count_A * 50 + count_B * 30 + count_C * 20 + count_D * 15
    # special_offers = special_A * 130 + special_B * 45
    # return normal_offers + special_offers
    
  end

end
