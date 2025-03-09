require 'rails_helper'

RSpec.describe Payment, type: :model do
    let!(:loan) {Loan.create(funded_amount: 1000)}

    it "payment_should_not_exceeds_outstanding_balance" do 
        loan.payments.create!(amount: 200.0,payment_date: Date.today)
        payment = Payment.new(loan_id: loan.id,amount: 1000.00,payment_date: Date.today)

        expect(payment.valid?).to be(false)
        expect(payment.errors[:amount]).to include("should not exceeds the outstanding balance")
    end
end
