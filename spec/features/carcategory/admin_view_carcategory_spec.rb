require 'rails_helper'

feature 'Admin view Car Categories' do
  scenario 'successfully' do
      car_category= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_part_insurance:800)
      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user

      visit root_path
      click_on 'Categorias'
                    
      expect(page).to have_css('li', text: car_category.name)
  end

  scenario 'and view details' do        
      cat_b= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_part_insurance:800)
      cat_c= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_part_insurance:300)
      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user
      
      visit root_path
      click_on 'Categorias'
      click_on 'Caminhonete'

      expect(page).to have_css('h1', text: 'Caminhonete')
      expect(page).to have_css('p', text: '1000')
      expect(page).to have_css('p', text: '500')
      expect(page).to have_css('p', text: '800')
      expect(page).not_to have_content('Coupe')

      expect(page).to have_link('Voltar', href: carcategories_path)
    end

    scenario 'and no categories are created' do
      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user
      visit root_path
      click_on 'Categorias'

      expect(page).to have_content('Nenhuma categoria de carro cadastrada')
    end

    scenario 'and return to home page' do
      car_category= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_part_insurance:800)
      car_category= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_part_insurance:300)
      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user

      visit root_path
      click_on 'Categorias'
      click_on 'Voltar'

      expect(current_path).to eq root_path
    end

    scenario 'and return to manufacturers page' do
      car_category= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_part_insurance:800)
      car_category= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_part_insurance:300)
      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user

      visit root_path
      click_on 'Categorias'
      click_on 'Coupe'
      click_on 'Voltar'

      expect(current_path).to eq carcategories_path
    end

    scenario 'and view filtered car models' do
      cat_b= Carcategory.create!(name: 'Caminhonete',daily_rate:1000,car_insurance: 500,third_part_insurance:800)
      cat_c= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,third_part_insurance:300)
      manufacturer= Manufacturer.create!(name: 'Fiat')

      uno = CarModel.create!(name:'Uno', year:2020, manufacturer: manufacturer, motorization: '1.0',fuel_type: 'Flex', carcategory: cat_b)
      mobi = CarModel.create!(name:'Mobi', year:2020, manufacturer: manufacturer, motorization: '1.0',fuel_type: 'Flex', carcategory: cat_c)
      #Logando
      user = User.create!(email: 'test@teste.com.br', password: '12345678')    
      login_as user, scope: :user
      
      visit root_path
      click_on 'Categorias'
      click_on 'Caminhonete'
      expect(page).not_to have_content('Coupe')

      expect(page).to have_link('Uno', href: car_model_path(uno))
      expect(page).not_to have_link('Mobi', href: car_model_path(mobi)) 
      
      expect(page).to have_link('Voltar', href: carcategories_path)
    end
    scenario 'cannot view unless logged in' do
      visit carcategories_path
  
      expect(current_path).to eq(new_user_session_path)
    end
    scenario 'cannot view unless logged in' do
      visit root_path
  
      expect(page).not_to have_link('Categorias')
    end
end