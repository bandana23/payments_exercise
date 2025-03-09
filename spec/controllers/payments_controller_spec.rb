require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

    let!(:loan) {create(:loan,funded_amount:1000,outstanding_balance: 1000)}

    describe 'POST #create' do 
        context 'when payment doesnot exceeds outstanding balance' do
            it 'will create a payment and reduces outstanding balance' do 
                post :create,params: {loan_id: loan.id,payment: {amount:500,payment_date: '2025-03-06'}}
                expect(response).to have_http_status(:created)
                expect(loan.reload.outstanding_balance).to eq(500)
            end
        end

        context 'when payment exceeds outstanding balance' do
            it 'should return an error with 422 status' do
                post :create,params:{loan_id: loan.id,payment: {amount:15000,payment_date: '2025-03-06'}}
                #since status code is 422
                expect(response).to have_http_status(:unprocessable_entity)
                json =JSON.parse(response.body)
                expect(json['error']).to include('Payment exceeds outstanding balance')
            end
        end
    end
    
    describe 'GET #index' do
        it 'will return all payments for a loan' do 
            payment = create(:payment,loan_id: loan.id,amount: 500,payment_date: '2025-03-06')
            get :index, params:{loan_id: loan.id}
            expect(response).to have_http_status(:success)
            json = JSON.parse(response.body)
            expect(json.length).to eq(1)
            expect(json.first['amount'].to_f).to eq(500)
        end
    end

    describe 'GET #show' do
        it 'will return a specifice payment' do
            payment = create(:payment,id: loan.id,amount: 500,payment_date: '2025-03-06')
            get :show, params: { loan_id: loan.id, id: payment.id }
            expect(response).to have_http_status(:success)
            json = JSON.parse(response.body)
            expect(json['amount'].to_f).to eq(500)
        end
    end
end