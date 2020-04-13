require 'rails_helper'

feature 'Admin view subsidiaries' do
    scenario 'successfully' do
        subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'0001',address: 'Rua Direita,222')
        subsidiary= Subsidiary.create!(name: 'SIM',cnpj:'0002',address: 'Rua Esquerda,333')
        
        visit root_path
        click_on 'Filiais'
                     
        expect(page).to have_css('li', text: subsidiary.name)
    end

    scenario 'and view details' do        
        subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'0001',address: 'Rua Direita, 222')
        subsidiary= Subsidiary.create!(name: 'SIM',cnpj:'0002',address: 'Rua Esquerda, 333')
    
        visit root_path
        click_on 'Filiais'
        click_on 'Caoa'
    
        expect(page).to have_css('h1', text: 'Caoa')
        expect(page).to have_css('p', text: '0001')
        expect(page).to have_css('p', text: 'Rua Direita, 222')
        expect(page).not_to have_content('SIM')
      end
    
      scenario 'and no subsidiaries are created' do
        visit root_path
        click_on 'Filiais'
    
        expect(page).to have_content('Nenhuma filial cadastrada')
      end
    
      scenario 'and return to home page' do
        subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'0001',address: 'Rua Direita,222')
        subsidiary= Subsidiary.create!(name: 'SIM',cnpj:'0002',address: 'Rua Esquerda,333')
  
    
        visit root_path
        click_on 'Filiais'
        click_on 'Voltar'
    
        expect(current_path).to eq root_path
      end
    
      scenario 'and return to manufacturers page' do
        subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'0001',address: 'Rua Direita,222')
        subsidiary= Subsidiary.create!(name: 'SIM',cnpj:'0002',address: 'Rua Esquerda,333')
  
        visit root_path
        click_on 'Filiais'
        click_on 'Caoa'
        click_on 'Voltar'
    
        expect(current_path).to eq subsidiaries_path
      end
end