FactoryBot.define do
  factory :question do
    title { "MyString" }
    content { "MyText" }
    best_answer_id { 1 }
    user { nil }
  end
end
