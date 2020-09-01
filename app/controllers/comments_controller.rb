class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:new, :create]
  before_action :set_question_and_answer
  before_action :correct_user, only: :destroy

  def new
    
  end

  def create
    @comment.assign_attributes(comment_params)
    if @comment.save!
      redirect_to question_path(@question, anchor: "normal-answer"), notice: "コメントを投稿しました！"
    else
      flash_now[:alert] = "コメントの投稿に失敗しました！"
      render "new"
    end
  end

  def destroy
    @comment.destroy
    redirect_to question_path(@question, anchor: "commnet-container"), notice: "コメントを削除しました"
  end 

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_question_and_answer
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
  end

  def correct_user
    @comment = Comment.find(params[:id])
    unless current_user.id == @comment.user_id
      redirect_to root_path, alert: "この処理は無効です！"
    end
  end

  def set_comment
    @comment = current_user.comments.build(answer_id: params[:answer_id])
  end
end
