require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'from index page' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Categorias'

    expect(page).to have_link('Registrar nova categoria', href: new_carcategory_path)
  end

  scenario 'successfully' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Categorias'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'Van'
    fill_in 'Diária', with: '400'
    fill_in 'Seguro do carro', with: '500'
    fill_in 'Seguro contra terceiros', with: '1000'
    click_on 'Enviar'

    expect(current_path).to eq carcategory_path(Carcategory.last.id)
    expect(page).to have_content('Van')
    expect(page).to have_content('400')
    expect(page).to have_content('500')
    expect(page).to have_content('1000')
    expect(page).to have_link('Voltar')
  end
end
