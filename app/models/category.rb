class Category < ApplicationRecord
  has_many :subsidies, dependent: :destroy
end
