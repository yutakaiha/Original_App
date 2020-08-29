class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  scope :best_answer, -> (question) {joins(:question).merge(Question.answer_check(question))}
  
end
