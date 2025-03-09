class LoansController < ActionController::API
  before_action :set_loan,only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    @loans = Loan.all
    render json: @loans
  end

  def show
    @loan = Loan.find(params[:id])
    render json:@loan
  end

  private
  def set_loan
    @loan = Loan.find(params[:id])
  end

end
