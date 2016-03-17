module Iloan
  module Payment
    module Services
      class Create
        def initialize(loan, params)
          @loan = loan
          @attribute_data = params
          assert_validations
        end

        def call
          ActiveRecord::Base.transaction(requires_new: true) do
            create_payment
          end
        end

        private

        def create_payment
          payment = ::Payment.new(@attribute_data)
          payment.loan = @loan
          payment.save!
          payment
        end

        def outstanding_balance
          Iloan::Loan::Presenters::OutstandingBalance.new(@loan).call
        end

        def payment_over_outstanding?
          (outstanding_balance + @attribute_data[:amount]) > 0
        end

        def assert_validations
          fail Iloan::Error::ArgumentError, 'Invalid loan' if @loan.nil?
          fail Iloan::Error::ArgumentError, 'Invalid Arguments for Payment' if @attribute_data.empty?
          fail Iloan::Error::IncorrectOutstandingBalanceError, 'The payment is bigger than the outstand balance' if payment_over_outstanding?
        end

      end
    end
  end
end
