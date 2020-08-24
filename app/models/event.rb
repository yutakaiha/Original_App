class Event < ApplicationRecord
  has_many :subsidies, dependent: :destroy
end
