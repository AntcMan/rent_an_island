class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, :capacity, :description, :location, :price, presence: true
  validates :price, comparison: { greater_than: 0 }

  def unavailable_dates
    bookings.pluck(:check_in_date, :check_out_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end
