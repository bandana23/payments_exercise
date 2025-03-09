require 'rails_helper'

RSpec.describe LoansController, type: :controller do

  describe 'GET #index' do
    funded_amount = 1000.0
    let!(:loan) { create(:loan,funded_amount: funded_amount)}

    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'returns a list of loans with outstanding balance' do 
      get :index
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.first['outstanding_balance'].to_f).to eq( funded_amount )
    end
  end

  describe '#show' do
    funded_amount = 1000.0
    # let(:loan) { Loan.create!(funded_amount: 100.0) }
    let!(:loan) { create(:loan,funded_amount: funded_amount)}

    it 'responds with a 200' do
      get :show, params: { id: loan.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, params: { id: 10000 }
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns a loan with outstanding balance' do
      get :show,params: {id: loan.id} 
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['outstanding_balance'].to_f).to eq( funded_amount )
    end
  end
end
