module QuestionsHelper
  def ranking_of_category(category)
    category.questions.order(impressions_count: :desc).limit(5)
  end

  def ranking_of_all
    Question.order(impressions_count: :desc).limit(5)
  end
end
