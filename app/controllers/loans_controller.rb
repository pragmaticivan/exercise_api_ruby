class LoansController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Iloan::Loan::Queries::OrderedLoans.new.call
  end

  def show
    render json: Loan.find(params[:id])
  end
end
