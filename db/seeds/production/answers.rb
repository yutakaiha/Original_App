puts 'Create answers...'

0.upto(49) do |i|
  Answer.create!(
    content: Faker::Lorem.paragraph(sentence_count: 14),
    user_id: rand(1..99),
    question_id: rand(1..49)
  )
end

puts "データ投入完了"
puts "Answers = #{Answer.count}"