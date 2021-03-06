FactoryBot.define do
  factory :user do
    sequence(:nickname){ |n| "test_user#{n}"}
    sequence(:email){ |n| "test#{n}@example.com"}
    password{"foofoo"}
    password_confirmation{"foofoo"}

  end
end
