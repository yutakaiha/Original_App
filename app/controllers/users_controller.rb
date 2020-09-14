class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_questions_and_answers

  def show
    @total_questions = @questions.present? ? @questions.count : 0
    @total_answers = @answers.present? ? @answers.count : 0
    # ここから修正
    @total_best_answers = Question.where('best_user_id = ?', @user.id).count
    @chart_data = User.transform_chart_data(@total_best_answers, @total_answers)
  end

  private

  def correct_user
    if User.where(id: params[:id]).any?
      @user = User.find(params[:id])
      if @user == current_user
        @user
      else
        flash[:error] = 'アクセスすることはできません。'
        redirect_to root_path
      end
    else
      flash[:error] = 'データが存在しません'
      redirect_to root_path
    end
  end

  def set_questions_and_answers
    @questions = @user.questions
    @answers = @user.answers
  end
end
