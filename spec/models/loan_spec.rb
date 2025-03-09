require 'rails_helper'

RSpec.describe Loan, type: :model do
    it 'should calculate outstanding balance correctly' do 
        loan = Loan.create!(funded_amount: 1000.0)
    
        # Create some payments for the loan
        loan.payments.create!(amount: 200.0,payment_date: Date.today)
        loan.payments.create!(amount: 200.0,payment_date: Date.today)
        loan.payments.create!(amount: 200.0,payment_date: Date.today)
       
        expect(loan.outstanding_balance.to_f).to eq(400.0)
    end

end