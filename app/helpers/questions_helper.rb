module QuestionsHelper
  def ranking_of_category(category)
    category.questions.order(impressions_count: :desc).limit(5)
  end

  def ranking_of_all
    Question.order(impressions_count: :desc).limit(5)
  end

  def same_category_questions(question) 
    Category.find(question.category_id).questions.order(created_at: :desc).page(params[:page]).per(5)
  end
end
