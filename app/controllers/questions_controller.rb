class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @questions = @category.questionos.order(created_at: :desc).page(params[:page]).per(7)
    else
      @all_questions = Question.order(created_at: :desc).page(params[:page]).per(7)
    end
  end
end
