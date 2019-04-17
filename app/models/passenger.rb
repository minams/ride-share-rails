class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_charges
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost
    end
    return "%.2f" % (sum * 0.01)
  end
end
