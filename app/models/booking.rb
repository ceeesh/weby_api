class Booking < ApplicationRecord

  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :client
end
