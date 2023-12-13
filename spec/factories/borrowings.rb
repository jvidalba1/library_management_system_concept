FactoryBot.define do
  factory :borrowing do
    status { Random.rand(0..2) }
    association user
    created_at { Date.today }

    trait :returned do
      returned_at { Faker::Date.backward }
    end

    trait :overdue do

    end
  end
end
