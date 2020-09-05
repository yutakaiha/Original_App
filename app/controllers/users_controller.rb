class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_questions_and_answers

  def show
    @total_questions = @questions.present? ? @questions.count : 0
    @total_answers = @answers.present? ? @answers.count : 0
    # ここから修正
    @total_best_answers = Question.where("best_answer_id = ?", ＃＃＃).count 
  end

  private

  def correct_user
    @user = User.find(params[:id])
    if @user == current_user
      @user
    else
      flash[:error] = "アクセスすることはできません。"
      redirect_to root_path
    end
  end

  def set_questions_and_answers
    @questions = @user.questions
    @answers = @user.answers
  end
end
