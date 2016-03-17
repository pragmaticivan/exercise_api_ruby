module Iloan
  module Currency
      class CurrencyData
        def self.to_money(value)
          value.to_f
        end
      end
    end
  end
end
