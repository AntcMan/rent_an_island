class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  validates :check_in_date, :check_out_date, presence: true
end
