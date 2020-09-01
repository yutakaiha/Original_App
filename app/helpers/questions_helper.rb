module QuestionsHelper
  def ranking_by_category(category)
    category.questions.where.not(impressions_count: 0, impressions_count: nil).order(impressions_count: :desc).limit(5)
  end

  def ranking_by_all
    Question.where.not(impressions_count: 0, impressions_count: nil).order(impressions_count: :desc).limit(5)
  end

  def same_category_questions(question) 
    Category.find(question.category_id).questions.order(created_at: :desc).page(params[:page]).per(5)
  end

  def correct_user?(question)
    user = User.find_by(id: question.user_id)
    current_user == user
  end

  def except_best_answer(answers, question)
    answers.where.not("id = ?", question.best_answer_id)
  end

  # いいね機能
  def allready_favorite?(answer)
    answer.favorites.exists?(user_id: current_user.id)
  end

  def favorites_counts(answer)
    answer.favorites.where(answer_id: answer.id).count
  end

  # コメント機能
  def commenter_name(comment)
    User.find(comment.user_id).nickname
  end
end
