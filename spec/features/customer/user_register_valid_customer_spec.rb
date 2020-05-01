require 'rails_helper'

feature 'User register valid customer' do
    scenario 'and CPF must be unique' do
        Customer.create!(name: 'Alexandre', document: '902.181.269-05', email:'lima@gmail.com')
        #Logando
        user = User.create!(email: 'test@teste.com.br', password: '12345678')    
        login_as user, scope: :user
        
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
        
        fill_in 'Nome', with: 'Pedro'
        fill_in 'CPF', with: '902.181.269-05'
        fill_in 'Email', with: 'pedro@fatecsp.br'
        click_on 'Enviar'

        expect(page).to have_content('Documento já está em uso')
    end

    scenario 'and name can not be blank' do
        #Logando
        user = User.create!(email: 'test@teste.com.br', password: '12345678')    
        login_as user, scope: :user
        
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
    
        fill_in 'Nome', with: ''  
        fill_in 'CPF', with: '902.181.269-05'
        fill_in 'Email', with: 'lima@fatecsp.br'
        click_on 'Enviar'
    
        expect(page).to have_content('não pode ficar em branco')
      end

      scenario 'and CPF can not be blank' do
        #Logando
        user = User.create!(email: 'test@teste.com.br', password: '12345678')    
        login_as user, scope: :user

        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
    
        fill_in 'Nome', with: 'Alexandre'  
        fill_in 'CPF', with: ''
        fill_in 'Email', with: 'lima@gmail.com'
        click_on 'Enviar'
    
        expect(page).to have_content('não pode ficar em branco')
      end

      scenario 'and email can not be blank' do
        #Logando
        user = User.create!(email: 'test@teste.com.br', password: '12345678')    
        login_as user, scope: :user
        
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
    
        fill_in 'Nome', with: 'Alexandre'  
        fill_in 'CPF', with: '902.181.269-05'
        fill_in 'Email', with: ''
        click_on 'Enviar'
    
        expect(page).to have_content('Email não pode ficar em branco')
      end
      
end