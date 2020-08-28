puts 'Create users...'

0.upto(99) do |i|
  User.create!(
    nickname:Faker::Name.name,
    email: Faker::Internet.email,
    password: "password#{i}",
    password_confirmation: "password#{i}"
  )
end

puts "データ投入完了"
puts "Users = #{User.count}"