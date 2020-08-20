INFORMATION_COLUMUNS = %w[title content].freeze


titles = %w(新型コロナ特別定額給付金 新型コロナ感染症対応休業支援金 雇用調整助成金 住居確保給付金 ひとり親世帯臨時特別給付金)

content = <<-"EOS"
対象者
2020年4月1日から9月30日までの間に事業者の指示を受けて休業し、休業手当の支払いを受けられなかった中小企業の労働者

申請受付期間
2020年7月10日から郵送申請を開始します。オンライン申請も準備されています。
※詳しくは厚生労働省Webサイト等でご確認ください。

EOS

0.upto(49) do |i|
  Information.create!(
    title: titles[i % 5],
    content: content
  )
end

puts "データ投入完了"
puts "informations = #{Information.count}"

