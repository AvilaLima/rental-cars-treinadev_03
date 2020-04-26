class Customer < ApplicationRecord
    validates :name, uniqueness: { message: 'Nome deve ser único'}
    validates :name, presence: { message: 'Nome não pode ficar em branco'}
    validates :document, uniqueness: { message: 'CPF deve ser único'}
    validates :document, presence: { message: 'CPF não pode ficar em branco'}
    validates :email, presence: { message: 'Email não pode ficar em branco'}
    validates :email, uniqueness: { message: 'Email deve ser único'}
end
