module MoneyHelper
  def money(hash)
    Money.new(hash['amount'], hash['currency']).format
  end
end
