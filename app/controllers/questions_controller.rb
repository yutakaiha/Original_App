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

  def new
    @question = Question.new
    @categories = Category.all
  end
  
  def create 
    @questinon = current_user.questions.create!(question_params)
    redirect_to :questions, success: "質問を投稿しました！"
  end

  def show
    @question = Question.find(params[:id])
    impressionist(@question, nil, :unique => [:session_hash])
    @answers = @question.answers.page(params[:page]).per(3)
    @best_answer = @answers.best_answer(@question)
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :category_id)
  end
end
