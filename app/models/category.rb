class Category < ApplicationRecord
  has_many :subsidies, dependent: :destroy
  validates :title, presence: true
end
