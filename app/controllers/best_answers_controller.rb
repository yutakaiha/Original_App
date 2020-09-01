class BestAnswersController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to root_path
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @answer.question.update!(best_answer_id: @answer.id)
    @question = Question.find(params[:question_id])
    redirect_to @question, notice: "ベストアンサーとして登録しました！"
  end
end
