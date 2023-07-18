# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    return -1 if skus.match(/[^A-Z]/)

    prices = {
      'A' => {price: 50, offers: [[3, 130], [5, 200]]},
      'B' => {price: 30, offers: [[2, 45]]},
      'C' => {price: 20, offers: []},
      'D' => {price: 15, offers: []},
      'E' => {price: 40, offers: []},
      'F' => {price: 10, offers: [[3, 20]]},
      'G' => {price: 20, offers: [[3, 20]]},
      'H' => {price: 10, offers: [[3, 20]]},
      'I' => {price: 35, offers: [[3, 20]]},
      'J' => {price: 60, offers: [[3, 20]]},
      'K' => {price: 80, offers: [[3, 20]]},
      'L' => {price: 90, offers: [[3, 20]]},
      'M' => {price: 15, offers: [[3, 20]]},
      'N' => {price: 40, offers: [[3, 20]]},
      'O' => {price: 10, offers: [[3, 20]]},
      'P' => {price: 50, offers: [[3, 20]]},
      'Q' => {price: 30, offers: [[3, 20]]},
      'R' => {price: 50, offers: [[3, 20]]},
      'S' => {price: 30, offers: [[3, 20]]},
      'T' => {price: 20, offers: [[3, 20]]},
      'U' => {price: 40, offers: [[3, 20]]},
      'V' => {price: 50, offers: [[3, 20]]},
      'W' => {price: 20, offers: [[3, 20]]},
      'X' => {price: 90, offers: [[3, 20]]},
      'Y' => {price: 10, offers: [[3, 20]]},
      'Z' => {price: 50, offers: [[3, 20]]},
    }
    total = 0
    sku_count = Hash.new(0)

    skus.each_char do |sku|
      sku_count[sku] += 1
    end

    sku_count["B"] -= sku_count["E"] / 2
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
    
  end

end
