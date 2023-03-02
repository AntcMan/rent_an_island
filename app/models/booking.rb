class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  validates :check_in_date, :check_out_date, presence: true, availability: true

  validate :check_out_after_check_in

  private

  def check_out_after_check_in
    return if check_out_date.blank? || check_in_date.blank?

    if check_out_date < check_in_date
      errors.add(:check_out_date, "must be after the check-in date")
    end
  end

end
