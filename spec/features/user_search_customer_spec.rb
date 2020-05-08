require 'rails_helper'

feature 'User search customer' do 
  scenario 'by exact name' do    
    user = User.create!(email: 'test@teste.com.br', password: '12345678')
    customer= Customer.create!(name: 'Alexandre',
      document: '902.181.269-05', 
      email:'lima@fatecsp.br')  
      another_customer= Customer.create!(name: 'Pablo',
        document: '356.333.524-91', 
        email:'pablo@fatecsp.br')

    login_as user, scope: :user
    visit root_path

    click_on 'Clientes'
    fill_in 'Busca', with: customer.name
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)

  end

  scenario 'by partial name' do    
    user = User.create!(email: 'test@teste.com.br', password: '12345678')
    customer= Customer.create!(name: 'Alexandre Lima',
      document: '902.181.269-05', 
      email:'lima@fatecsp.br')  
      another_customer= Customer.create!(name: 'Pablo',
        document: '356.333.524-91', 
        email:'pablo@fatecsp.br')

    login_as user, scope: :user
    visit root_path

    click_on 'Clientes'
    fill_in 'Busca', with: "Alexandre"
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)

  end

  xscenario 'finds nothing' do
  end
end