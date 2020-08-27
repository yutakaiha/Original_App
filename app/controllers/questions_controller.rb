class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @caquestions = @category.questionos.order(created_at: :desc).page(params[:page]).per(7)
    else

    end
    @questions = Question.order(created_at: :desc)
  end
end
