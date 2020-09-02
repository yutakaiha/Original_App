class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy
  is_impressionable counter_cache: true
  with_options presence: true do
    validates :title
    validates :content, length: {maximum: 1000, too_long: "最大#{count}文字まで扱えます"}
    validates :user_id
    validates :category_id
  end


  # ベストアンサー（relationオブジェクトを返す） 
  # nil、falseの場合allがallクエリメソッドが適用されるためビュー側で条件分岐
  scope :answer_check, ->(question) {where("answers.id = ?", question.best_answer_id)}
  
  
  def self.ransackable_attributes(auth_object = nil)
      %w[title]
  end

  def self.ransackable_associations(auth_object = nil)
      []
  end
end
