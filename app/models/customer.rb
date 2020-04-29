class Customer < ApplicationRecord
  has_many :rental

  validates :name, uniqueness: { message: 'já está em uso'}
  validates :name, presence: { message: 'não pode ficar em branco'}

  validates :document, uniqueness: { message: 'já está em uso'}
  validates :document, presence: { message: 'não pode ficar em branco'}
  validates :document, format: { with: /\A^\d{3}\.\d{3}\.\d{3}\-\d{2}$\z/, message: 'com formato inválido'}

  validates :email, presence: { message: 'não pode ficar em branco'}
  validates :email, uniqueness: { message: 'já está em uso'}
  
  validate :cpf_must_be_valid

  private

  def cpf_must_be_valid
    unless CPF.valid?(document)
      errors.add(:document, 'não é válido')      
    end
  end
end
