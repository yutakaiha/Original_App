module ApplicationHelper
  def select_info
    Information.order(created_at: :desc).limit(5)
  end

  def most_viewd
    Information.order(impressions_count: :desc).limit(5)
  end

  def all_category
    Category.all
  end

  def best_answer_name(answer)
    user_id = answer.pluck(:user_id)[0]
    User.find_by(id: user_id).nickname
  end

  def best_answer_date(answer)
    answer.pluck(:created_at)[0].strftime("%Y/%m/%d %H:%M:%S")
  end

  def best_answer_content(answer)
    answer.pluck(:content)[0]
  end

  def answer_name(answer)
    User.find_by(id: answer.user_id).nickname
  end


  SELECT_CATEGORIES = %w[くらしと手続き（税金・国保・年金・ごみ・環境等）
                        子育て・教育（教育委員会、子育て支援事業等）
                        医療・福祉（健康、高齢者医療、介護保険等）
                        文化・スポーツ（生涯学習、スポーツ支援、文化芸術、公民館等）
                        産業・観光（地域活性化事業、食べる・買う、農林水産等）
                        都市計画（景観、建築、道路、住まい、土地利用等）]

  def select_category_form
    category_list = []
    SELECT_CATEGORIES.each.with_index(1) do |category, i|
      category_list << [category, i]
      category_list
    end
  end
end
