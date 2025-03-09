# Loan.create!(funded_amount: 100.0)

loan1 = Loan.create!(funded_amount: 1000.00)  # Loan with $1000 balance
loan2 = Loan.create!(funded_amount: 5000.00)  # Loan with $5000 balance

#Here Creating some payments for loan1
Payment.create!(loan_id: loan1.id, amount: 500.00, payment_date: Date.today)
Payment.create!(loan_id: loan1.id, amount: 300.00, payment_date: Date.today - 30.days)

#Here Creating some payments for loan2
Payment.create!(loan_id: loan2.id, amount: 1000.00, payment_date: Date.today)
Payment.create!(loan_id: loan2.id, amount: 1500.00, payment_date: Date.today - 60.days)


