class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @search = @category.questions.ransack(params[:q])
      @questions = @search.result.page(params[:page]).per(7)
    else
      @search = Question.ransack(params[:q])
      @all_questions = @search.result.page(params[:page]).per(7)
    end
  end

  def show
    @question = Question.find(params[:id])
    impressionist(@question, nil, :unique => [:session_hash])
    @answers = @question.answers.page(params[:page]).per(3)
    @best_answer = @answers.best_answer(@question)
  end

end
