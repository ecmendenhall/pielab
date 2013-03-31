FactoryGirl.define do
    factory :user do
        sequence(:name)  { |n| "Beatrice #{n} Fastwater" }
        sequence(:email) { |n| "bzf#{n}@pielab.info" }
        password "beatrice"
        password_confirmation "beatrice"

        factory :admin do
            admin true
        end
    end
    
    factory :post do
        content "Pies are rad, guys!"
        title "Pies are rad!"
        user
    end
end
