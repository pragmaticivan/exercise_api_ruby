module Iloan
  module Loan
    module Queries
      class OrderedLoans
        def initialize(params = {})
          @order_by = params[:order_by].nil? ? 'created_at' : params[:order_by]
          @order = params[:order] ? 'DESC' : params[:order]
        end

        def call
          ::Loan.order("#{@order_by} #{@order}").all
        end
      end
    end
  end
end
