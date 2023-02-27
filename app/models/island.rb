class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :capacity, :description, :location, :price, presence: true
  validates :price, comparison: { greater_than: 0 }
end
