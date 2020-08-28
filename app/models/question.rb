class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  is_impressionable counter_cache: true

  def self.ransackable_attributes(auth_object = nil)
      %w[title]
  end

  def self.ransackable_associations(auth_object = nil)
      []
  end
end
