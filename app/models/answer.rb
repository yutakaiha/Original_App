class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commentting_users, through: :comments, source: :user
  validates :content, presence: true, length: { maximum: 1000, too_long: "最大1000文字まで扱えます" }
  

  scope :best_answer, -> (question) {joins(:question).merge(Question.answer_check(question))}
  
end
