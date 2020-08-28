class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  is_impressionable counter_cache: true
end
