module QuestionsHelper
  def ranking_of_category(category)
    category.questions.order(impressions_count: :desc).limit(5)
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
end
