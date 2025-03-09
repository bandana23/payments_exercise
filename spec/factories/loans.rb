FactoryBot.define do
    factory :loan do
      funded_amount { 1000 } 
      outstanding_balance { funded_amount }
    end
end