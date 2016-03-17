require 'rails_helper'

RSpec.describe Iloan::Loan::Presenters::OutstandingBalance do
  describe '#call' do
    context 'has no payments' do
      let!(:loan) { Fabricate :loan, funded_amount: 12_000_000}
      it 'returns the outstanding balance equal to funded amount' do
        instance = Iloan::Loan::Presenters::OutstandingBalance.new(loan)
        expect(instance.call).to eq -(loan.funded_amount.abs)
      end
    end

    context 'has payments' do
      let!(:loan) { Fabricate :loan, funded_amount: 12_000_000}
      let!(:payment) { Fabricate :payment, loan: loan, amount: 11_000_000}
      it 'returns an array of loans' do
        instance = Iloan::Loan::Presenters::OutstandingBalance.new(loan)
        expect(instance.call).to eq -(1_000_000.abs)
      end
    end
    
    context 'invalid param' do
      it "raise an error for invalid param" do
        expect{Iloan::Loan::Presenters::OutstandingBalance.new(nil)}.to raise_error(Iloan::Error::ArgumentError)
      end
    end
  end
end
