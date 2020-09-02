class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  validates :content, presence: true, length: {maximum: 1000, message: "最大文字数は1000文字です。"}
end
