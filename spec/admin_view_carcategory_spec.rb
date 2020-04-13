require 'rails_helper'

feature 'Admin view Car Categories' do
    scenario 'successfully' do
        car_category= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_party_insurance:800)
        car_category= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_party_insurance:300)
        
        visit root_path
        click_on 'Categorias'
                     
        expect(page).to have_css('li', text: car_category.name)
    end

    scenario 'and view details' do        
        car_category= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_party_insurance:800)
        car_category= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_party_insurance:300)
    
        visit root_path
        click_on 'Categorias'
        click_on 'Caminhonete'
    
        expect(page).to have_css('h1', text: 'Caminhonete')
        expect(page).to have_css('p', text: '1000')
        expect(page).to have_css('p', text: '500')
        expect(page).to have_css('p', text: '800')
        expect(page).not_to have_content('Coupe')
      end
    
      scenario 'and no categories are created' do
        visit root_path
        click_on 'Categorias'
    
        expect(page).to have_content('Nenhuma categoria de carro cadastrada')
      end
    
      scenario 'and return to home page' do
        car_category= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_party_insurance:800)
        car_category= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_party_insurance:300)
    
        visit root_path
        click_on 'Categorias'
        click_on 'Voltar'
    
        expect(current_path).to eq root_path
      end
    
      scenario 'and return to manufacturers page' do
        car_category= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_party_insurance:800)
        car_category= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_party_insurance:300)

        visit root_path
        click_on 'Categorias'
        click_on 'Coupe'
        click_on 'Voltar'
    
        expect(current_path).to eq carcategories_path
      end
end