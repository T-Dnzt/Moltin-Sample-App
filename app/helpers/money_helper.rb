module MoneyHelper
  def money(hash)
    p hash
    Money.new(hash['amount'], hash['currency']).format
  end
end
