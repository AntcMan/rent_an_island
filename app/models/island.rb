class Island < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, :capacity, :description, :location, :price, presence: true
  validates :price, comparison: { greater_than: 0 }
end
