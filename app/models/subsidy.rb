class Subsidy < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content
    validates :start_date
  end
end
