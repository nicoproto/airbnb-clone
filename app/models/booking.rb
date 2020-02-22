class Booking < ApplicationRecord
  belongs_to :pokemon
  belongs_to :user

  has_many :reviews, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :status, inclusion: { in: %w[pending confirmed denied completed] }
end
