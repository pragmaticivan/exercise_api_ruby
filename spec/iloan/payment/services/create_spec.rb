require 'rails_helper'

describe Iloan::Payment::Services::Create do
  describe '#call' do
    context 'with valide data' do
      let(:loan) { Fabricate :loan, funded_amount: 9_000}
      let!(:data) { Fabricate.attributes_for :payment, amount: 1_000}
      it 'creates a valid payment for a loan' do
        instance = Iloan::Payment::Services::Create.new(loan, data)
        payment = instance.call
        expect(payment[:amount]).to eq(data[:amount])
        expect(Payment.count).to eq(1)
      end
    end

    context 'with invalid data' do
      let(:loan) { Fabricate :loan, funded_amount: 9_000}
      let!(:data) { {} }
      it 'raise an error if it has invalid data as params' do
        expect{Iloan::Payment::Services::Create.new(loan, data)}.to raise_error(Iloan::Error::ArgumentError)
      end
    end

    context 'with invalid payment comparing with outstanding balance' do
      let(:loan) { Fabricate :loan, funded_amount: 9_000}
      let!(:payment) { Fabricate :payment, loan: loan, amount:  8_000}
      let!(:data) { Fabricate.attributes_for :payment, amount: 2_000}
      it 'raise an error for when payment passes the outstanding balance' do
        expect{Iloan::Payment::Services::Create.new(loan, data)}.to raise_error(Iloan::Error::IncorrectOutstandingBalanceError)
      end
    end

  end
end
