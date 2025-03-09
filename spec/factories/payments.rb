FactoryBot.define do 
    factory :payment do 
        amount {100}
        payment_date {'2025-03-06'}
        association :loan
    end
end