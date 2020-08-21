class Information < ApplicationRecord
  with_options presence: true do
    validates :title, length: { maximum: 30}
    validates :content
  end
  
end
