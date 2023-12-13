FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }

    factory :librarian do
      type { 'Librarian' }
    end

    factory :member do
      type { 'Member' }
    end
  end
end
