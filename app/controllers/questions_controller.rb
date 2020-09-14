class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, only: :destroy

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @search = @category.questions.ransack(params[:q])
      @questions = @search.result.order(created_at: :desc).page(params[:page]).per(7)
    else
      @search = Question.ransack(params[:q])
      @all_questions = @search.result.order(created_at: :desc).page(params[:page]).per(7)
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to :questions, notice: '質問を投稿しました！'
    else
      render 'new'
    end
  end

  def show
    if Question.where(id: params[:id]).any?
      @question = Question.find(params[:id])
      impressionist(@question, nil, unique: [:session_hash])
      @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(Settings.service.answer_pagination)
      @best_answer = @answers.best_answer(@question) if @question.best_answer_id
    else
      flash[:error] = 'データは存在しませんでした。'
      redirect_to questions_path
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: '投稿した質問を削除しました！'
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
