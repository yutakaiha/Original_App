class Information < ApplicationRecord
  is_impressionable counter_cache: true
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :content
  end
end
