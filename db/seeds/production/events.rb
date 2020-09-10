EVENTS = %w[妊娠・出産 子育て・保育 学校教育 結婚・離婚 引越し・暮らし 就職・退職 高齢者・介護 おくやみ]
                
IMAGES = %w[ninnsinn.png kosodate.png kyouiku.png kekkonn.png hikkoushi.png syuusyoku.png kaigo.png okuyami.png]

puts 'Create categories...'

0.upto(7) do |i|
  Event.create!(
    title: EVENTS[i],
    picture: IMAGES[i]
  )
end

puts "データ投入完了"
puts "life_events = #{Event.count}"