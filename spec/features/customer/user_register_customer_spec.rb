require 'rails_helper'

feature 'User register customer' do
    scenario 'from index page' do
        visit root_path
        click_on 'Clientes'

        expect(page).to have_link('Registrar novo cliente', href: new_customer_path)
    end

    scenario 'successfully' do
        visit root_path
        click_on 'Clientes'
        click_on 'Registrar novo cliente'

        fill_in 'Nome', with: 'Alexandre'
        fill_in 'CPF', with: '41143398840'
        fill_in 'Email', with: 'lima@fatecsp.br'
        click_on 'Enviar'

        expect(current_path).to eq customer_path(Customer.last.id)
        expect(page).to have_content('Alexandre')
        expect(page).to have_content('41143398840')
        expect(page).to have_content('lima@fatecsp.br')

        expect(page).to have_link('Voltar')
        click_on 'Voltar'
        expect(current_path).to eq customers_path

    end
end