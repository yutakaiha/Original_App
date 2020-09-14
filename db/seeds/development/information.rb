

titles = %w(新型コロナ特別定額給付金 新型コロナ感染症対応休業支援金 雇用調整助成金 住居確保給付金 ひとり親世帯臨時特別給付金
            生活再建支援金給付事業 スポーツ活動における県外派遣補助金 家賃支援給付金)

content = <<-"EOS"

【給付対象者】
在宅で家族等から買物支援が得られない方で、既存の買物支援サービスの利用がない方で、下記のいずれかに該当する者
①65歳以上独居世帯および高齢者のみ世帯
②64歳以下の独居世帯で障がい者手帳（内部障害）所持者
③64歳以下の独居世帯で特定医療費（指定難病）受給者
④64歳以下の独居世帯でその他の障がいで支援が必要な者

【助成額】
給付対象者１人につき〇〇万円

【申請方法】
■オンライン申請
◎申請開始日：５月11日（月）
◎給付日：○月○○日（金）から順次給付

■郵送による申請
申請書に必要事項の記入及び確認資料等を添付し、同封の返信用封筒にて申請書を送付。なお、給付については、○月下旬より順次給付予定。

【給付の方法】
給付は、原則として申請者の本人名義の銀行口座への振込。

【申請受付期間】
2020年○月○○日から郵送申請を開始します。オンライン申請も準備されています。
※詳しくは厚生労働省Webサイト等でご確認ください。

【受付窓口】
○○部○○課○○係 （☎︎ ○○○−○○○−○○○）

EOS

0.upto(63) do |i|
  Information.create!(
    title: titles[i % 8],
    content: content,
    impressions_count: rand(100),
    created_at: 150.days.ago.advance(days: rand(50)),
  )
end

puts "データ投入完了"
puts "informations = #{Information.count}"

