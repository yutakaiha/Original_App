class BestAnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:create, :destroy]
  before_action :correct_user?, only: [:create, :destroy]

  def show
    redirect_to root_path
  end

  def create
    @answer.question.update!(best_answer_id: @answer.id)
    redirect_to @question, notice: "ベストアンサーとして登録しました！"
  end

  def destroy
    @question.update!(best_answer_id: nil)
    redirect_to @question, notice: "ベストアンサーの登録を解除しました！"
  end

  private

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def correct_user?
    @question = Question.find(params[:question_id])
    @user = User.find_by(id: @question.user_id)
    unless current_user == @user
      redirect_to questions_path, alert: "この操作は無効です！"
    end 
  end
end
