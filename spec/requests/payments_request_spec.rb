require 'rails_helper'

RSpec.describe "Payments", type: :request do
  let(:loan) { Loan.create!(funded_amount: 1000.00) }
  describe "GET /index" do
    it "returns http success" do
      get loan_payments_path(loan_id: loan.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      payment = Payment.create!(amount: 100, loan_id: loan.id, payment_date: Date.today)
      get loan_payment_path(loan_id: loan.id, id: payment.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      loan = Loan.create!(funded_amount: 2000.00)  
      payment = Payment.create!(amount: 600.00, payment_date: Date.today, loan: loan)
      post loan_payments_path(loan_id: loan.id), params: { payment: { amount: 600.00, payment_date: Date.today } }
      expect(response).to have_http_status(:success)
    end
  end

end
