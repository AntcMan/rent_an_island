class Island < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, :capacity, :description, :location, :price, presence: true
  validates :price, comparison: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_parameters,
    against: [ :name, :location, :description],
    using: {
      tsearch: { prefix: true } # <-- now `quiet will return something!
    }

  def unavailable_dates
    bookings.pluck(:check_in_date, :check_out_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
