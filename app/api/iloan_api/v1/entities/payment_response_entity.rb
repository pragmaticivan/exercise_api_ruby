module IloanApi
  module V1
    module Entities
      class PaymentResponseEntity < Grape::Entity
        format_with(:iso_timestamp, &:iso8601)

        expose :id, documentation: { type: 'integer', desc: 'ID' }
        expose :amount, documentation: { type: 'integer', desc: 'Amount' }
        expose :payment_date, documentation: { type: 'date', desc: 'Payment Date'}

        with_options(format_with: :iso_timestamp) do
          expose :created_at, documentation: { type: 'string', desc: 'Created at' }
          expose :updated_at, documentation: { type: 'string', desc: 'Updated at' }
        end
      end
    end
  end
end
