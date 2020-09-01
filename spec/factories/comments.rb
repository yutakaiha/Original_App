FactoryBot.define do
  factory :comment do
    contetn { "MyText" }
    user { nil }
    answer { "" }
  end
end
