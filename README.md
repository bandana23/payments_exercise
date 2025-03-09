# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.


#Bandana

I added Two  models Loan and Payment
Association: :has_many  and :belongs_to
As Loan has many Payments and Payments belongs to association.

when I started this applocation I am having issue with ruby version 2.6.8 bcus in my systme I am using ruby3 which uses openssl 3 and rails 7 so got ssl error so I downloaded openssl@1 and installed ruby through RVM since openssl3 will not support ruby2.6.8 so I have to carete this folder newly and I did the setup. 
First run the command gem install bundler because we need to check bundler version with compatible 2.6.8.
Then I run bundle install and rails db:setup and rails s to chekc evrything working fine or not.

Then I created model with rails command with Migration and controller and corresponding test case for model and controller.

I used Rspec and Factory Bot for the test.

To run the test:

all test:
bundle exec rspec

model test:
bundle exec spec/models/loan_spec.rb
bundle exec spec/models/payment_spec.rb

controller test:
bundle exec spec/controllers/payments_controller_spec.rb
bundle exec spec/controllers/loan_controller_spec.rb

Added validation as per the task.

I didnt add any html becuase of no time since I have to submit it.
I added some data in seed.rb file and rails db:seed will create data.
to check loan data
http://localhost:3000/loans
to check payment data
http://localhost:3000/loans/1/payments
to get single paymnet of loan
http://localhost:3000/loans/1/payments/1
