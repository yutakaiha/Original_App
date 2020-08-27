class Category < ApplicationRecord
  has_many :subsidies, dependent: :destroy
  has_many :questions, dependent: :destroy
  validates :title, presence: true
end
