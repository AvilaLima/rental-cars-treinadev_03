class Carcategory < ApplicationRecord
  has_many :car_models
    
  validates :name, uniqueness: { message: 'Nome deve ser único'}
  validates :name, presence: { message: 'Nome não pode ficar em branco'}
  
  validates_numericality_of :daily_rate, greater_than: 0
  validates_numericality_of :car_insurance, greater_than: 0
  validates_numericality_of :third_party_insurance, greater_than: 0
  
end
