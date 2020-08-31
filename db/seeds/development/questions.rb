0.upto(99) do |i|
  Question.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph(sentence_count: 10),
    created_at: 150.days.ago.advance(days: rand(50)),
    category_id: CATEGORYID[i % 6],
    user_id: rand(1..99),
    impressions_count: rand(100)
  )
end

puts "データ投入完了"
puts "questions = #{Question.count}"
