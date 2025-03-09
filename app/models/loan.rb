class Loan < ActiveRecord::Base
    has_many :payments,dependent: :destroy
    validates :funded_amount,presence: true,numericality: {greater_than: 0}
    
    # lets calculate outstanding balance
    def calculate_outstanding_balance
        total_payments = payments.sum(:amount)
        remaining_balance=funded_amount - total_payments
        remaining_balance
    end
    
end
