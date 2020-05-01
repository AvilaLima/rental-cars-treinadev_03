require 'rails_helper'
feature 'Admin edit subsidiaries' do
  scenario 'successfully' do
    subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')

    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Caoa'
    click_on 'Editar'
    
    fill_in 'Nome', with: 'Sunolandia'
    fill_in 'CNPJ', with: '36.418.249/0001-69'
    fill_in 'Endereço', with: 'Rua do suno, 789'
    click_on 'Enviar'

    expect(page).to have_content('Sunolandia')
    expect(page).not_to have_content('Caoa')

    expect(current_path).to eq subsidiary_path(subsidiary)
    
  end

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')

    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Caoa'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end

  context '#name' do
    scenario 'cannot be blank' do
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')

      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user
      visit root_path
      
      click_on 'Filiais'
      click_on 'Caoa'
      click_on 'Editar'
      fill_in 'Nome', with: ''
      fill_in 'CNPJ', with: '36.418.249/0001-69'
      fill_in 'Endereço', with: 'Rua do suno, 789'
      click_on 'Enviar'

      expect(page).to have_content('não pode ficar em branco')
      expect(current_path).to eq subsidiary_path(subsidiary)
      
    end

    scenario 'must be unique' do
      subsidiary = Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      subsidiary_a = Subsidiary.create!(name: 'SIM',cnpj:'94.201.741/0001-84',address: 'Rua Esquerda, 333')

      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user
      visit root_path
      
      click_on 'Filiais'
      click_on 'SIM'
      click_on 'Editar'
      fill_in 'Nome', with: 'Caoa'
      click_on 'Enviar'
      
      expect(page).to have_content('Nome já está em uso')
    end
  end
  
end