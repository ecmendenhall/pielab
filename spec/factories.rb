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
end
