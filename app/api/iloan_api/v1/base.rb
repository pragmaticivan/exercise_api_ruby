module IloanApi
  module V1
    class Base < Grape::API
      version 'v1', using: :path

      mount Loans
      mount Payments


    end
  end
end
