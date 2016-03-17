module Iloan
  module Loan
    module Presenters
      class OutstandingBalance
        def initialize(loan)
          @loan = loan
          @paid_amount = 0
          assert_validations
        end

        def call
          loan_amount = @loan.funded_amount
          load_current_paid_amount
          amount = loan_amount - @paid_amount
          -(amount.abs)
        end

        private

        def load_current_paid_amount
          @loan.payments.each do |payment|
            @paid_amount += payment.amount
          end
        end

        def assert_validations
          fail Iloan::Error::ArgumentError, 'Invalid loan' if @loan.nil?
        end
      end
    end
  end
end
