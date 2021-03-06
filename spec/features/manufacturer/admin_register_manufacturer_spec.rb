require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'from index page' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_link('Registrar novo fabricante', href: new_manufacturer_path)
  end

  scenario 'successfully' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(current_path).to eq manufacturer_path(Manufacturer.last.id)
    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end

  scenario 'cannot view unless logged in' do
    visit new_manufacturer_path

    expect(current_path).to eq(new_user_session_path)
  end
  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Fabricantes')
  end
end
