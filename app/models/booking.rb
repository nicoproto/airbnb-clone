class Booking < ApplicationRecord
  before_save :check_overlaping
  belongs_to :pokemon
  belongs_to :user
  monetize :amount_cents

  has_many :reviews, dependent: :destroy

  validates :start_date, :end_date, presence: true #, availability: true
  validate :end_date_after_start_date

  # validates :start_date, presence: true
  # validates :end_date, presence: true

  validates :state, presence: true

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def overlaps?(request_start_date, request_end_date)
    end_date >= request_start_date && start_date <= request_end_date
  end

  def check_overlaping
    Booking.where(pokemon: pokemon).all?(overlaps?(start_date, end_date))
  end
end
