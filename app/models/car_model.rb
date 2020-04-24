class CarModel < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :carcategory
end
