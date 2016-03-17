module IloanApi::V1::SharedParams
  extend Grape::API::Helpers

  params :order do |options|
    optional :order_by, type:Symbol, values:options[:order_by], default:options[:default_order_by], desc: "Order by 'field'"
    optional :order, type:Symbol, values:%i(asc desc), default:options[:default_order], desc: "Order by 'ordination'"
  end
end
