# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    case skus
      when "A" then 50
      when "B" then 30
      when "C" then 20
      when "D" then 15
      else -1
    end
  end

end
