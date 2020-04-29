class CarModel < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :carcategory
  validates :name, :year,  :motorization,:fuel_type, presence: true
end
