class Subsidy < ApplicationRecord
  belongs_to :category
  belongs_to :event
  with_options presence: true do
    validates :title
    validates :content
    validates :start_date
  end

  def self.ransackable_attributes(auth_object = nil)
      %w[title]
  end

  def self.ransackable_associations(auth_object = nil)
      []
  end
end
