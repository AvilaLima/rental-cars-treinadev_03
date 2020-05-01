require 'rails_helper'

feature 'Admin register car' do
  scenario 'from index page' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    visit root_path
    click_on 'Carros'

    expect(page).to have_link('Registrar novo carro', href: new_car_path)
  end

  scenario 'successfully' do    
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')
    login_as user, scope: :user

    fiat=Manufacturer.create!(name: 'Fiat')
    subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
    cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
    cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)

    visit root_path
    click_on 'Carros'
    click_on 'Registrar novo carro'

    fill_in 'Placa', with: 'BMF-2790'
    fill_in 'Cor', with: 'Bege'
    fill_in 'Quilometragem', with: '200000'
    select subsidiary.name, from: 'Filial'
    select cm.name, from: 'Modelo de Carro'
    click_on 'Enviar'

    expect(current_path).to eq car_path(CarModel.last.id)
    expect(page).to have_content('BMF-2790')
    expect(page).to have_content('Bege')
    expect(page).to have_content('200000')
    expect(page).to have_content('Caoa')
    expect(page).to have_content('Toro')
    expect(page).to have_link('Voltar')
  end

  scenario 'and fill all fields' do    
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user

    visit new_car_path
    fill_in 'Placa', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Placa não pode ficar em branco')
    expect(page).to have_content('Cor não pode ficar em branco')
    expect(page).to have_content('Quilometragem não pode ficar em branco')
    expect(page).to have_content('Filial é obrigatório(a)')
    expect(page).to have_content('Modelo do carro é obrigatório(a)')
    expect(current_path).to eq(new_car_path)

  end

  scenario 'license plate uniqueness' do    
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')    
    login_as user, scope: :user
    
    fiat=Manufacturer.create!(name: 'Fiat')
    subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
    cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
    cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
    Car.create!(license_plate:'BMF-2790',color:'Bege',car_model: cm,mileage:'200000',subsidiary:subsidiary)

    visit new_car_path
    fill_in 'Placa', with: 'BMF-2790'
    fill_in 'Cor', with: 'Bege'
    fill_in 'Quilometragem', with: '200000'
    select subsidiary.name, from: 'Filial'
    select cm.name, from: 'Modelo de Carro'
    click_on 'Enviar'

    expect(page).to have_content('Placa já está em uso')
    expect(current_path).to eq(new_car_path)
  end

  scenario 'mileage greater than 0' do
    #Logando
    user = User.create!(email: 'test@teste.com.br', password: '12345678')
    login_as user, scope: :user

    fiat=Manufacturer.create!(name: 'Fiat')
    subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
    cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
    cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)

    visit root_path
    click_on 'Carros'
    click_on 'Registrar novo carro'

    fill_in 'Placa', with: 'BMF-2790'
    fill_in 'Cor', with: 'Bege'
    fill_in 'Quilometragem', with: '0'
    select subsidiary.name, from: 'Filial'
    select cm.name, from: 'Modelo de Carro'
    click_on 'Enviar'

    
    expect(page).to have_content('deve ser maior que 0')
    expect(current_path).to eq(new_car_path)

  end
  scenario 'cannot view unless logged in' do
    visit new_car_path

    expect(current_path).to eq(new_user_session_path)
  end
end