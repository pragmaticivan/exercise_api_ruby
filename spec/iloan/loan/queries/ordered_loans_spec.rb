require 'rails_helper'

describe Iloan::Loan::Queries::OrderedLoans do
  describe '#call' do
    context 'has data' do
      let!(:loan1) { Fabricate :loan}
      let!(:loan2) { Fabricate :loan}
      it 'returns an array of loans' do
        instance = Iloan::Loan::Queries::OrderedLoans.new
        expect(instance.call).to match_array([loan1, loan2])
      end
    end

    context 'with order param' do
      let!(:loan1) { Fabricate :loan, funded_amount: 9_000_000}
      let!(:loan2) { Fabricate :loan, funded_amount: 12_000_000}
      it 'returns an array of loans ordered by funded amount' do
        instance = Iloan::Loan::Queries::OrderedLoans.new(order_by: 'funded_amount', order: 'DESC')
        expect(instance.call).to contain_exactly(loan2, loan1)
      end
    end

    context 'has no data' do
      it 'returns an empty array of loans' do
        instance = Iloan::Loan::Queries::OrderedLoans.new
        expect(instance.call).to be_empty
      end
    end
  end
end
