CATEGORIES = %w[くらしと手続き（税金・国保・年金・ごみ・環境等）
                子育て・教育（教育委員会、子育て支援事業等）
                医療・福祉（健康、高齢者医療、介護保険等）
                文化・スポーツ（生涯学習、スポーツ支援、文化芸術、公民館等）
                産業・観光（地域活性化事業、食べる・買う、農林水産等）
                都市計画（景観、建築、道路、住まい、土地利用等）]

PICTURES = %w[nenkin.png ikuji.png fukushi.png sports.jpg kannkou.jpg matinami.jpg]

puts 'Create categories...'

0.upto(5) do |i|
  Category.create!(
    title: CATEGORIES[i],
    picture: PICTURES[i]
  )
end

puts "データ投入完了"
puts "categories = #{Category.count}"