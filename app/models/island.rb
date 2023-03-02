class Island < ApplicationRecord
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
end
