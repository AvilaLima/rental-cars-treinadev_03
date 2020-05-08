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

  context '#search' do  
    it 'by exact name' do    
      customer= Customer.create!(name: 'Alexandre',
        document: '902.181.269-05', 
        email:'lima@fatecsp.br')  
      another_customer= Customer.create!(name: 'Pablo',
        document: '356.333.524-91', 
        email:'pablo@fatecsp.br')

      result = Customer.search(customer.name)
      expect(result).to include(customer)
      expect(result).not_to include(another_customer)
  
    end
    it 'by partial name' do    
      customer= Customer.create!(name: 'Alexandre Lima',
        document: '902.181.269-05', 
        email:'lima@fatecsp.br')  
      another_customer= Customer.create!(name: 'Pablo',
          document: '356.333.524-91', 
          email:'pablo@fatecsp.br')
  
      result = Customer.search('Alexandre')
  
      expect(result).to include(customer)
      expect(result).not_to include(another_customer)
  
    end

    it 'finds nothing' do    
      customer= Customer.create!(name: 'Alexandre Lima',
        document: '902.181.269-05', 
        email:'lima@fatecsp.br')  
      another_customer= Customer.create!(name: 'Pablo',
          document: '356.333.524-91', 
          email:'pablo@fatecsp.br')
  
      result = Customer.search('test')
  
      expect(result).to be_blank
  
    end

    it 'by cpf' do    
      customer= Customer.create!(name: 'Alexandre Lima',
        document: '902.181.269-05', 
        email:'lima@fatecsp.br')  
      another_customer= Customer.create!(name: 'Pablo',
          document: '356.333.524-91', 
          email:'pablo@fatecsp.br')
  
      result = Customer.search('902.181.269-05')
  
      expect(result).to include(customer)
      expect(result).not_to include(another_customer)
  
    end
  end
end
