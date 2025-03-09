class Payment < ActiveRecord::Base
  belongs_to :loan
  validates :amount,presence: true,numericality: {greater_than: 0}
  validates :payment_date,presence: true
  after_create :update_outstanding_balance

  #custom validation to check payment should nt exceeds outstanding balance
  validate :payment_should_not_exceeds_outstanding_balance

  def payment_should_not_exceeds_outstanding_balance
    if loan.nil?
      errors.add(:loan, "must exist")
    else
      if amount > loan.calculate_outstanding_balance
        puts "errors".inspect
        errors.add(:amount, "should not exceeds the outstanding balance")
      end
    end
  end

  private
  #updating outstanding balance to loan table
  def update_outstanding_balance
    new_outstanding_balance = loan.funded_amount - loan.payments.sum(:amount)
    loan.update(outstanding_balance: new_outstanding_balance)
  end

end
