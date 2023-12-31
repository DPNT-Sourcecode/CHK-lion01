# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    return -1 if skus.match(/[^A-Z]/)

    @prices = {
      'A' => {price: 50, offers: [[3, 130], [5, 200]]},
      'B' => {price: 30, offers: [[2, 45]]},
      'C' => {price: 20, offers: []},
      'D' => {price: 15, offers: []},
      'E' => {price: 40, offers: []},
      'F' => {price: 10, offers: [[3, 20]]},
      'G' => {price: 20, offers: []},
      'H' => {price: 10, offers: [[5, 45], [10, 80]]},
      'I' => {price: 35, offers: []},
      'J' => {price: 60, offers: []},
      'K' => {price: 70, offers: [[2, 120]]},
      'L' => {price: 90, offers: []},
      'M' => {price: 15, offers: []},
      'N' => {price: 40, offers: []},
      'O' => {price: 10, offers: []},
      'P' => {price: 50, offers: [[5, 200]]},
      'Q' => {price: 30, offers: [[3, 80]]},
      'R' => {price: 50, offers: []},
      'S' => {price: 20, offers: [[3, 45]]},
      'T' => {price: 20, offers: [[3, 45]]},
      'U' => {price: 40, offers: [[4, 120]]},
      'V' => {price: 50, offers: [[2, 90], [3, 130]]},
      'W' => {price: 20, offers: []},
      'X' => {price: 17, offers: [[3, 45]]},
      'Y' => {price: 20, offers: [[3, 45]]},
      'Z' => {price: 21, offers: [[3, 45]]},
    }

    @total = 0
    @sku_count = Hash.new(0)
    @grouped_offer = []

    skus.each_char do |sku|
      @sku_count[sku] += 1
      if ['S', 'T', 'X', 'Y', 'Z'].include?(sku)
        @grouped_offer << @prices[sku][:price]
      end
    end

    calculate_grouped_offer
    adjust_total_for_free_items
    calculate_nongrouped
  
    return @total += @total_grouped_offer
    
  end

  private

  def adjust_total_for_free_items
    @sku_count["B"] -= @sku_count["E"] / 2
    if @sku_count["B"] < 0 then @sku_count["B"] = 0 end
    
    @sku_count["M"] -= @sku_count["N"] / 3
    if @sku_count["M"] < 0 then @sku_count["M"] = 0 end

    @sku_count["Q"] -= @sku_count["R"] / 3
    if @sku_count["Q"] < 0 then @sku_count["Q"] = 0 end
  end

  def calculate_nongrouped
    @sku_count.each do |sku, count|
      next if ['S', 'T', 'X', 'Y', 'Z'].include?(sku)

      normal_price = @prices[sku][:price]
      special_offers = @prices[sku][:offers]
      accum = count
      special_offers.sort.reverse_each do |offer_count, offer_price|
        while accum >= offer_count
          @total += offer_price
          accum -= offer_count
        end
      end
      @total += normal_price * accum
    end
  end

  def calculate_grouped_offer
    number_of_grouped_offers = @grouped_offer.length / 3
    remaining_grouped_sku = @grouped_offer.length % 3
    @total_grouped_offer = number_of_grouped_offers * 45
    @total_grouped_offer += @grouped_offer.sort.take(remaining_grouped_sku).sum
  end

end

