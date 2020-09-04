FactoryBot.define do
  factory :answer do
    content { "MyText" }
    association :user
    association :question
  end
end
