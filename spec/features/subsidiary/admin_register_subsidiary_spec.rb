require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Sunolandia'
    fill_in 'CNPJ', with: '36.418.249/0001-69'
    fill_in 'Endereço', with: 'Rua do suno, 789'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Sunolandia')
    expect(page).to have_content('36.418.249/0001-69')
    expect(page).to have_content('Rua do suno, 789')
    expect(page).to have_link('Voltar')
    
    click_on 'Voltar'
    expect(current_path).to eq subsidiaries_path
  end
  scenario 'cannot view unless logged in' do
    visit new_subsidiary_path

    expect(current_path).to eq(new_user_session_path)
  end
end
