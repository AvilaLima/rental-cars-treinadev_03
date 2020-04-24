require 'rails_helper'

feature 'Admin view car models' do
    scenario 'successfully' do
        #arrange
        fiat =  Manufacturer.create!(name: 'Fiat')
        cat_a= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_party_insurance:300)
        
        ford = Manufacturer.create!(name: 'Ford')

        CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, motorization: '1.0', fuel_type: 'Flex', carcategory: cat_a)            
        CarModel.create!(name: 'Ka', year: 2021, manufacturer: ford, motorization: '1.4', fuel_type: 'Flex', carcategory: cat_a)            

        #act
        visit root_path
        click_on 'Modelos de Carros'
        
        #assert
        expect(page).to have_content 'Fiat'
        expect(page).to have_content 'Uno'
        expect(page).to have_content '2020'


        expect(page).to have_content 'Ford'
        expect(page).to have_content 'Ka'
        expect(page).to have_content '2021'
    end
    scenario 'no car models' do
       
        visit root_path
        click_on 'Modelos de Carros'
    
        expect(page).to have_content('Nenhum modelo de carro cadastrado') 
    end

    scenario 'and view details' do
        
        #arrange
        fiat =  Manufacturer.create!(name: 'Fiat')
        cat_a= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_party_insurance:300)
        uno = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, motorization: '1.0', fuel_type: 'Flex', carcategory: cat_a)    
        
        cat_e= Carcategory.create!(name: 'Caminhonete',daily_rate:200,car_insurance: 350,third_party_insurance:500)
        CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)     

        #act
        visit root_path
        click_on 'Modelos de Carros'
        #click_on 'Ver Detalhes'
        #click_on "details-#{uno.id}" ou find("a#details-#{uno.id}").click()
        within("tr#car-model-#{uno.id}")do
            #page = escopo do seletor CSS
            click_on 'Ver Detalhes'
        end
        #assert
        expect(page).to have_content 'Uno'
        expect(page).to have_content 'Fabricante: Fiat'
        expect(page).to have_content 'Ano: 2020'
        expect(page).to have_content 'Motor: 1.0'
        expect(page).to have_content 'Categoria: Coupe'
        expect(page).to have_content 'Diária: R$ 500,00'
        expect(page).to have_content 'Seguro do Carro: R$ 150,00'
        expect(page).to have_content 'Seguro contra terceiros: R$ 300,00'


        expect(page).not_to have_content 'Toro'
        expect(page).not_to have_content 'Motor: 2.0'
    end
end