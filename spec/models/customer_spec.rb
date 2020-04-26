require 'rails_helper'

describe Customer do
  context '#name' do     
    it 'cannot be blank' do
      customer = Customer.new(name: '')
      customer.valid?
      expect(customer.errors[:name]).to include('não pode ficar em branco')
    end

    it 'must be unique' do
      Customer.create!(name: 'Paulista',document:'314.417.718-08',email: 'lima@gmail.com')
      customer = Customer.new(name: 'Paulista',document:'314.417.718-08',email: 'lima@hotmail.com')
      customer.valid?
      expect(customer.errors[:name]).to include('já está em uso')
    end 
  end

  context '#cpf' do     
    it 'cannot be blank' do
      customer = Customer.new(name: 'Paulista', document: '',email: 'lima@gmail.com')
      customer.valid?
      expect(customer.errors[:document]).to include('não pode ficar em branco')
    end

    it 'must be unique' do
      Customer.create!(name: 'Paulista',document:'192.943.311-56',email: 'lima@gmail.com')
      customer = Customer.new(name: 'Carioca',document:'192.943.311-56',email: 'lima@hotmail.com')
      customer.valid?
      expect(customer.errors[:document]).to include('já está em uso')
    end 

    it 'must be valid' do
      customer = Customer.new(name: 'Paulista',document: '123.345.789-00',email: 'lima@gmail.com')
      customer.valid?
      expect(customer.errors[:document]).to include('não é válido')
    end
    
    it 'must be format' do
      customer = Customer.new(name: 'Paulista',document: '314.417.71808',email: 'lima@gmail.com')
      customer.valid?
      expect(customer.errors[:document]).to include('com formato inválido')
    end
  end
end
