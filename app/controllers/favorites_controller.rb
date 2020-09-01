class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question

  def create
    answer = current_user.favorites.create!(answer_id: params[:answer_id])
    redirect_to question_path(@question, anchor: "goodBtn"), notice: "いいね！しました"
  end

  def destroy
    favorite = Favorite.find_by(answer_id: params[:answer_id], user_id: current_user.id)
    favorite.destroy
    redirect_to question_path(@question, anchor: "goodBtn"), notice: "いいねを取り消しました！"
  end 

  def set_question
    @question = Question.find(params[:question_id])
  end

end
