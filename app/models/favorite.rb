class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  validates :user_id, presence :true, uniqueness: {scope: :answer_id}
  validates :answer_id, presence :true
end
