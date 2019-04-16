class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true

  def money_earned
    money = 0

    trips.each do |trip|
      money += trip.cost
    end
    total_money = (0.85 * money)
    return total_money
  end

  def average_rating
  end
end
