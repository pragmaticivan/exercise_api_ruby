module IloanApi
  module V1
    module Entities
      class LoanResponseEntity < Grape::Entity
        format_with(:iso_timestamp, &:iso8601)

        expose :id, documentation: { type: 'integer', desc: 'ID' }
        expose :funded_amount, documentation: { type: 'integer', desc: 'Funded Amount' }
        expose :currency, documentation: { type: 'string',  desc: 'Currency' }

        expose :outstanding_balance do |loan|
          Iloan::Loan::Presenters::OutstandingBalance.new(loan).call
        end
        with_options(format_with: :iso_timestamp) do
          expose :created_at, documentation: { type: 'string', desc: 'Created at' }
          expose :updated_at, documentation: { type: 'string', desc: 'Updated at' }
        end
      end
    end
  end
end
