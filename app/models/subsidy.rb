class Subsidy < ApplicationRecord
  belongs_to :category
  belongs_to :event
  with_options presence: true do
    validates :title
    validates :content
    validates :start_date
  end
end
