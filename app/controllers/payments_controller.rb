class PaymentsController < ActionController::API

  before_action :set_loan,  only: [:index,:create]
  before_action :set_payment, only: [:show]

  def index
    @payments = @loan.payments
    render json: @payments
  end

  def show
    @payment = Payment.find_by(id: params[:id])

    if @payment
      render json: @payment
    else
      render json: { error: 'Payment not found' }, status: :not_found
    end
  end

  def create
    @payment = @loan.payments.new(payment_params)
    @loan = Loan.find_by(id: params[:loan_id])

    if @loan.nil?
      render json: { error: 'Loan not found' }, status: :not_found
    elsif @payment.amount > @loan.outstanding_balance
      render json: { error: 'Payment exceeds outstanding balance' }, status: :unprocessable_entity
    else
      if @payment.save
        render json: @payment,status: :created
      else
        render json: {errors: @payment.errors.full_messages}
      end
    end
  end

  private

  def set_loan
      @loan = Loan.find(params[:loan_id])
  end

  def set_payment
    @payment = Payment.find(params[:id])
    render_not_found unless @payment
  end

  def payment_params
    params.require(:payment).permit(:amount,:payment_date,:loan_id)
  end
end
