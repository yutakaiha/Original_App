class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_answers, through: :favorites, source: :answer
  has_many :comments, dependent: :destroy
  has_many :commented_answers, through: :comments, source: :answer
  has_one_attached :image

  validates :nickname, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
end


