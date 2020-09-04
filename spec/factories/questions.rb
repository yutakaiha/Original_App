FactoryBot.define do
  factory :question do
    title { "MyString" }
    content { "MyText" }
    best_answer_id { nil }
    association :user
    association :category
  end
end
