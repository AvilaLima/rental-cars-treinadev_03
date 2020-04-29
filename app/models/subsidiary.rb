class Subsidiary < ApplicationRecord
  validates :name, presence: { message: 'não pode ficar em branco'}
  validates :cnpj, uniqueness: true, presence: { message: 'não pode ficar em branco'}
  validates :name, uniqueness: true
  validates :cnpj, format: { with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/, message: 'com formato inválido'}
  validate :cnpj_must_be_valid

  private

  def cnpj_must_be_valid
    unless CNPJ.valid?(cnpj)
      errors.add(:cnpj, :invalid)      
    end
  end
end
