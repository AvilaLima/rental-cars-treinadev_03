class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary
  validates :license_plate, :color, :mileage ,presence: true
  validates :license_plate, uniqueness: true

  validates_numericality_of :mileage, greater_than: 0
end
