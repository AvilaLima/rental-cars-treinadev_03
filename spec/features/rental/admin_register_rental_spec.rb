require 'rails_helper'

feature 'Admin register rental' do
  scenario 'successfully' do
    customer= Customer.create!(name: 'Alexandre',
                              document: '902.181.269-05', 
                              email:'lima@fatecsp.br')
    car_category= Carcategory.create!(name: 'Categoria A',
                                      daily_rate:50,
                                      car_insurance: 100,
                                      third_part_insurance:150)
    user = User.create!(email: 'test@teste.com.br', password: '12345678')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    click_on 'Registrar nova locação'

    fill_in 'Data de início', with: '27/04/2030'
    fill_in 'Data de término', with: '29/04/2030'
    select customer.name, from: 'Cliente'
    select car_category.name, from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content('Data de início: 27/04/2030')
    expect(page).to have_content('Data de término: 29/04/2030')
    expect(page).to have_content("Cliente: #{customer.name}")
    expect(page).to have_content("Categoria: #{car_category.name}")
  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Locações')
  end
  scenario 'cannot view unless logged in' do
    visit new_rental_path

    expect(current_path).to eq(new_user_session_path)
  end
end