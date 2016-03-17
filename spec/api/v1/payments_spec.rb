require 'rails_helper'

describe IloanApi::V1::Payments do

  describe 'GET /api/v1/loans/{loan_id}/payments' do
    context 'without data' do
      let(:loan) { Fabricate :loan  }
      before(:each) do
        get "/api/v1/loans/#{loan.id}/payments"
      end
      it 'should return a status code 200' do
        expect(response.status).to eq 200
      end
      it 'should return an empty array' do
        expect(json).to be_empty
      end
    end
    context 'with data' do
      let(:loan) { Fabricate :loan }
      let!(:payment) { Fabricate :payment, loan: loan}
      before(:each) do
        get "/api/v1/loans/#{loan.id}/payments"
      end
      it 'returns a status code 200' do
        expect(response.status).to eq 200
      end
      it 'returns a list of payments of a loan' do
        expect(json[0]['id']).to eq(payment.id)
      end
    end
  end

  describe 'POST /api/v1/loans/{loan_id}/payments' do
    let(:loan) { Fabricate :loan, funded_amount: 14_000_000 }
    it 'creates a payment' do

      param = {
        payment: {
          amount: 12_000_000,
          payment_date: '2016-10-10'
        }
      }
      request_headers = {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      post "/api/v1/loans/#{loan.id}/payments", param.to_json, request_headers

      expect(response.status).to eq(201)

      expect(json['amount']).to eq(12000000)
    end
  end


end
