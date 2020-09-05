module UsersHelper
  def best_answer_rate(best_answers, total_answers)
    if total_answers != 0
      (best_answers / total_answers * 100 ).round
    else
      "まだ回答が一つもありません。"
    end
  end
end
