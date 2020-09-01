class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :associate_question
  before_action :judge_user_about_new_and_create, only: [:new, :create]
  before_action :judge_user_of_detroy, only: :destroy

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

  def destroy
    @answer.destroy
    redirect_to @question, notice: "自身の回答を削除しました！"
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def associate_question
    @question = Question.find(params[:question_id])
  end

  def judge_user_about_new_and_create
    @user = User.find_by(id: @question.user_id)
    if current_user == @user
      redirect_to questions_path, alert: "自身の質問に対しての回答は無効です！"
    end
  end

  def judge_user_of_detroy
    @answer = Answer.find(params[:id])
    if current_user.id == @answer.user_id
      @answer
    else
      redirect_to root_path, alert: "この操作は無効です！"
    end
  end
end
