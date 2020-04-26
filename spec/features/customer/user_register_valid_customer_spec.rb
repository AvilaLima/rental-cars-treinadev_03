require 'rails_helper'

feature 'User register valid customer' do
    scenario 'and CPF must be unique' do
        Customer.create!(name: 'Alexandre', document: '41143398840', email:'lima@fatecsp.br')
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
        
        fill_in 'Nome', with: 'Alexandre'
        fill_in 'CPF', with: '41143398840'
        fill_in 'Email', with: 'lima@fatecsp.br'
        click_on 'Enviar'

        expect(page).to have_content('CPF deve ser único')
    end

    scenario 'and name can not be blank' do
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
    
        fill_in 'Nome', with: ''  
        fill_in 'CPF', with: '41143398840'
        fill_in 'Email', with: 'lima@fatecsp.br'
        click_on 'Enviar'
    
        expect(page).to have_content('Nome não pode ficar em branco')
      end

      scenario 'and CPF can not be blank' do
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
    
        fill_in 'Nome', with: 'Alexandre'  
        fill_in 'CPF', with: ''
        fill_in 'Email', with: 'lima@fatecsp.br'
        click_on 'Enviar'
    
        expect(page).to have_content('CPF não pode ficar em branco')
      end

      scenario 'and email can not be blank' do
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'
    
        fill_in 'Nome', with: 'Alexandre'  
        fill_in 'CPF', with: '41143398840'
        fill_in 'Email', with: ''
        click_on 'Enviar'
    
        expect(page).to have_content('Email não pode ficar em branco')
      end
      
end