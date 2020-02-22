class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, length: { in: 20..200 }
end
