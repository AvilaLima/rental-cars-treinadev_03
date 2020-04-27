require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
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
end
