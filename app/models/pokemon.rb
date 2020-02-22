class Pokemon < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, presence: true
  validates :description, length: { in: 50..500 }
  validates :price, presence: true
  validates :pokemon_type, inclusion: { in: %w[electric fire water grass] }
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_type_owner,
    against: [:name, :pokemon_type],
    associated_against: {
      user: [:email]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
