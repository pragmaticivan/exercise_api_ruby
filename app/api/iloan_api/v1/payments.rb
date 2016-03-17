module IloanApi
  module V1
    class Payments < Grape::API
      helpers IloanApi::V1::SharedParams

      resource :loans do
        segment '/:id' do
          resource :payments do
            desc "List all payments of a Loan",
            http_codes: [
              [200, 'Ok', IloanApi::V1::Entities::PaymentResponseEntity],
              [404, "Loan Not Found"]
            ],
            notes: <<-NOTE
            Example Request
            -----------
                GET http://localhost:3000/api/v1/loans/{id}/payments
            NOTE
            params do
              requires :id, type: String, desc: "Loan ID"
            end
            get '' do
              begin
                loan = ::Loan.find(params[:id])
                present loan.payments, with: IloanApi::V1::Entities::PaymentResponseEntity
              rescue ActiveRecord::RecordNotFound => e
                error!({ error: { message: "#{e.message}", error: "#{e.class} error", code: 404 }}, 404)
              end
            end

            desc "Create a Payment",
            http_codes: [
              [201, 'Created', IloanApi::V1::Entities::PaymentResponseEntity],
              [404, "Loan Not Found"]
            ],
            notes: <<-NOTE
            Example Request
            --------

                POST http://localhost:3000/api/v1/loans/{id}/payments

                {
                  "payment": {
                    "amount": 100000,
                    "payment_date": '2015-10-10'
                  }
                }

            NOTE
            params do
              requires :payment, type: Hash do
                requires :amount, type: Integer
                requires :payment_date, type: Date
              end
            end
            post '' do
              begin
                loan = ::Loan.find(params[:id])
                payment = Iloan::Payment::Services::Create.new(loan, params[:payment]).call
                present payment, with: IloanApi::V1::Entities::PaymentResponseEntity
              rescue StandardError => e
                error!({ error: { message: "#{e.message}", error: "#{e.class} error", code: 404 }}, 404)
              end
            end

          end
        end
      end
    end
  end
end
