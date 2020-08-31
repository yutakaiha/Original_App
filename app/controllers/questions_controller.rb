class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, only: :destroy

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
    redirect_to :questions, notice: "質問を投稿しました！"
  end

  def show
    @question = Question.find(params[:id])
    impressionist(@question, nil, :unique => [:session_hash])
    @answers = @question.answers.page(params[:page]).per(3)
    @best_answer = @answers.best_answer(@question)
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "投稿した質問を削除しました！"
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :category_id)
  end

  def correct_user?
    @question = Question.find(params[:id])
    @user = User.find_by(id: @question.user_id)
    redirect_to questions_path unless current_user == @user
    @question
  end
end
