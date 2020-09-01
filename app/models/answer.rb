class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :favorites

  scope :best_answer, -> (question) {joins(:question).merge(Question.answer_check(question))}
  
end
