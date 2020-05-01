require 'rails_helper'
require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    fiat=Manufacturer.create!(name: 'Fiat')
    subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
    cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
    cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
    Car.create!(license_plate:'BMF-2790',color:'Bege',car_model: cm,mileage:'200000',subsidiary:subsidiary)
    Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)


    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
                  
    expect(page).to have_content('BMF-2790')
    expect(page).to have_content(cm.name)
    expect(page).to have_content(subsidiary.name)

    expect(page).to have_content('XDG-1090')
    expect(page).to have_content(cm.name)
    expect(page).to have_content(subsidiary.name)
  end

  scenario 'and view details' do      
    fiat=Manufacturer.create!(name: 'Fiat')  
    subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
    cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
    cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
    Car.create!(license_plate:'BMF-2790',color:'Bege',car_model: cm,mileage:'200000',subsidiary:subsidiary)
    Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)

    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
    click_on 'BMF-2790'

    expect(page).to have_content('BMF-2790')
    expect(page).to have_content('Bege')
    expect(page).to have_content('200000')
    expect(page).to have_content(cm.name)
    expect(page).to have_content(subsidiary.name)
    expect(page).not_to have_content('XDG-1090')
  end

  scenario 'and no cars are created' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Carros'

    expect(page).to have_content('Nenhum carro cadastrado')
  end

  scenario 'and return to home page' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to cars page' do
    fiat=Manufacturer.create!(name: 'Fiat')
    subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
    cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
    cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
    Car.create!(license_plate:'BMF-2790',color:'Bege',car_model: cm,mileage:'200000',subsidiary:subsidiary)
    Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)

    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
    click_on 'BMF-2790'
    click_on 'Voltar'

    expect(current_path).to eq cars_path
  end
  scenario 'cannot view unless logged in' do
    visit cars_path

    expect(current_path).to eq(new_user_session_path)
  end
  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Carros')
  end
end