require 'rails_helper'

feature 'User register customer' do
    scenario 'from index page' do
        #Logando
        user = User.create!(email: 'test@teste.com.br', password: '12345678')    
        login_as user, scope: :user
        visit root_path
        click_on 'Clientes'

        expect(page).to have_link('Registrar novo cliente', href: new_customer_path)
    end

    scenario 'successfully' do
        #Logando
        user = User.create!(email: 'test@teste.com.br', password: '12345678')    
        login_as user, scope: :user
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'

        fill_in 'Nome', with: 'Alexandre'
        fill_in 'CPF', with: '411.433.988-40'
        fill_in 'Email', with: 'lima@fatecsp.br'
        click_on 'Enviar'

        expect(current_path).to eq customer_path(Customer.last.id)
        expect(page).to have_content('Alexandre')
        expect(page).to have_content('411.433.988-40')
        expect(page).to have_content('lima@fatecsp.br')

        expect(page).to have_link('Voltar')
        click_on 'Voltar'
        expect(current_path).to eq customers_path

    end
    scenario 'cannot view unless logged in' do
        visit root_path
    
        expect(page).not_to have_link('Clientes')
    end
    scenario 'cannot view unless logged in' do
      visit new_customer_path
  
      expect(current_path).to eq(new_user_session_path)
    end
end