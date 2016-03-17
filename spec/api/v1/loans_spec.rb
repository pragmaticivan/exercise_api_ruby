require 'rails_helper'

describe IloanApi::V1::Loans do

  describe 'GET /api/v1/loans' do
    context 'without data' do
      before(:each) do
        get '/api/v1/loans'
      end
      it 'should return a status code 200' do
        expect(response.status).to eq 200
      end
      it 'should return an empty array' do
        expect(json).to be_empty
      end
    end
    context 'with data' do
      let!(:loan) { Fabricate(:loan) }
      before(:each) do
        get '/api/v1/loans'
      end
      it 'returns a status code 200' do
        expect(response.status).to eq 200
      end
      it 'returns a loan' do
        expect(json[0]['id']).to eq(loan.id)
      end
    end
  end

  describe 'GET /api/v1/loans/{id}' do
    context 'without data' do
      before(:each) do
        get '/api/v1/loans/909809809809'
      end
      it 'should return a status code 404' do
        expect(response.status).to eq 404
      end
    end
    context 'with data' do
      let!(:loan) { Fabricate(:loan) }
      before(:each) do
        get "/api/v1/loans/#{loan.id}"
      end
      it 'returns a status code 200' do
        expect(response.status).to eq 200
      end
      it 'returns a loan' do
        expect(json['id']).to eq(loan.id)
      end
    end
  end
end
