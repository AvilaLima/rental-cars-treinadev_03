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
    fill_in 'CNPJ', with: '9999'
    fill_in 'Endereço', with: 'Rua do suno, 789'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Sunolandia')
    expect(page).to have_content('9999')
    expect(page).to have_content('Rua do suno, 789')
    expect(page).to have_link('Voltar')
  end
end
