class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :associate_question

  def new
    @answer = @question.answers.build(user_id: current_user.id)
  end

  def create
    @answer = @question.answers.build(user_id: current_user.id)
    @answer.assign_attributes(answer_params)
    if @answer.save!
      redirect_to question_path(@question, anchor: "normal-answer"), notice: "回答を投稿しました！"
    else
      flash_now[:alert] = "回答の投稿に失敗しました！"
      render "new"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def associate_question
    @question = Question.find(params[:question_id])
  end
end
