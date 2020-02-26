class Pokemon < ApplicationRecord
  POKE_TYPES = %w[electric fire water grass flying poison bug normal ground]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, presence: true
  validates :description, length: { in: 50..500 }
  validates :price, presence: true
  validates :pokemon_type, inclusion: { in: POKE_TYPES }
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_type_owner,
                  against: %i[name pokemon_type],
                  associated_against: {
                    user: [:email]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  def self.poke_types
    POKE_TYPES.map &:capitalize
  end

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
