class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true

  def money_earned
  end

  def average_rating
  end
end
