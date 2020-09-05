class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_answers, through: :favorites, source: :answer
  has_many :comments, dependent: :destroy
  has_many :commented_answers, through: :comments, source: :answer
  has_one_attached :image

  validates :nickname, presence: true
  validates :image, content_type: {in: %w[image/jpg image/jpeg image/gif image/png],
                    message: "画像ファイル形式は「jpg（jpeg）, gif, png」のみになります。"},
            size: {less_than: 6.megabytes, message: "ファイルサイズは６MB未満でなければなりません。"}

  def resize_image
    image.variant(resize_to_limit: [300, 300])
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
end


