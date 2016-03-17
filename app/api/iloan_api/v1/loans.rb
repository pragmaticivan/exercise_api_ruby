module IloanApi
  module V1
    class Loans < Grape::API
      helpers IloanApi::V1::SharedParams

      resource :loans do
        desc 'Return all loans',
          http_codes: [
            [200, 'Ok', IloanApi::V1::Entities::LoanResponseEntity],
            [304, "Not Modified"],
            [401, "Unauthorized"]
          ],
          :notes => <<-NOTE
          Example Request
          --------
              GET http://localhost:3000/api/v1/loans

          NOTE
        params do
          use :order, order_by:%i(id created_at), default_order_by: :created_at, default_order: :desc
        end
        get "" do
          present Iloan::Loan::Queries::OrderedLoans.new(order_by:params[:order_by]).call, with: IloanApi::V1::Entities::LoanResponseEntity
        end

        desc "Return a Loan",
          http_codes: [
            [200, 'Ok', IloanApi::V1::Entities::LoanResponseEntity],
            [304, "Not Modified"],
            [401, "Unauthorized"],
            [404, "Not Found"]
          ],
          notes: <<-NOTE
          Example Request
          --------
              GET http://localhost:3000/api/v1/loans/{id}
          NOTE
        params do
          requires :id, type: Integer, desc: 'Loan id'
        end
        route_param :id do
          get "" do
            begin
              present Loan.find(params[:id]), with: IloanApi::V1::Entities::LoanResponseEntity
            rescue ActiveRecord::RecordNotFound => e
              error!({ error: { message: "#{e.message}", error: "#{e.class} error", code: 404 }}, 404)
            end
          end
        end

      end
    end
  end
end
