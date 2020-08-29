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
end
