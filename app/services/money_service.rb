require 'money'


class MoneyService

  def initialize
    Money.add_rate("EUR", "USD", 0.97984085)
    Money.add_rate("EUR", "GBP", 0.878101)
    Money.add_rate("GBP", "EUR", 1.13692)
    Money.add_rate("EUR", "JOD", 0.694811)
    Money.add_rate("EUR", "JPY", 142.073 )
  end

  def convert_from_euro(currency, amount)
    Money.euro(amount).exchange_to(currency)
  end

end
