class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_answers, through: :favorites, source: :answer
  has_many :comments, dependent: :destroy
  has_many :commented_answers, through: :comments, source: :answer
  has_one_attached :image
  attribute :remove_image, :boolean

  validates :nickname, presence: true
  validates :image, content_type: { in: %w[image/jpg image/jpeg image/gif image/png],
                                    message: '画像ファイル形式は「jpg（jpeg）, gif, png」のみになります。' },
                    size: { less_than: 6.megabytes, message: 'ファイルサイズは６MB未満でなければなりません。' }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.guest
    find_or_create_by!(nickname: 'ゲストユーザ', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def resize_image
    image.variant(resize_to_limit: [300, 300])
  end

  def self.transform_chart_data(best_answers, total_answers)
    other_answers = total_answers - best_answers
    data = { 'ベストアンサー' => best_answers, 'その他のアンサー' => other_answers }
  end
end
