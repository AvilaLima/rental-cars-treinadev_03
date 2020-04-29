require 'rails_helper'

feature 'Admin edits carcategory'do
  
  scenario 'sucessfully' do
    Carcategory.create!(name: 'Categoria A',daily_rate:50,car_insurance: 100,third_part_insurance:150)

    visit root_path
    click_on 'Categorias'
    click_on 'Categoria A'
    click_on 'Editar'
    
    expect(page).to have_content('Categoria A')
    expect(page).not_to have_content('Categoria S')

    fill_in 'Nome', with: 'Categoria: A'
    fill_in 'Diária', with: '50'
    fill_in 'Seguro do carro', with: '100'
    fill_in 'Seguro contra terceiros', with: '150'

    click_on 'Enviar'
  end

  scenario 'and return to subsidiaries page' do
    Carcategory.create!(name: 'Categoria A',daily_rate:50,car_insurance: 100,third_part_insurance:150)

    visit root_path
    click_on 'Categorias'
    click_on 'Categoria A'
    click_on 'Voltar'

    expect(current_path).to eq carcategories_path
  end

  scenario 'and name cannot be blank' do    
    Carcategory.create!(name: 'Categoria A',daily_rate:50,car_insurance: 100,third_part_insurance:150)
    visit root_path
    
    click_on 'Categorias'
    click_on 'Categoria A'
    click_on 'Editar'
    expect(page).to have_content('Categoria A')
    expect(page).not_to have_content('Categoria S')

    fill_in 'Nome', with: ''
    click_on 'Enviar'
    expect(page).to have_content('Nome não pode ficar em branco')
  end

  scenario 'and name must be unique' do
    Carcategory.create!(name: 'Categoria A',daily_rate:50,car_insurance: 100,third_part_insurance:150)
    Carcategory.create!(name: 'Categoria S',daily_rate:200,car_insurance: 250,third_part_insurance:400)

    visit root_path
    click_on 'Categorias'
    click_on 'Categoria A'
    click_on 'Editar'

    expect(page).to have_content('Categoria A')
    expect(page).not_to have_content('Categoria S')
    fill_in 'Nome', with: 'Categoria S'
    fill_in 'Diária', with: '50'
    fill_in 'Seguro do carro', with: '100'
    fill_in 'Seguro contra terceiros', with: '150'
    click_on 'Enviar'
    expect(page).to have_content('Nome deve ser único')
   
  end

  scenario 'and daily_rate and car_insurance and third_part_insurance cannot be less than zero' do
    Carcategory.create!(name: 'Categoria A',daily_rate:50,car_insurance: 100,third_part_insurance:150)

    visit root_path

    click_on 'Categorias'
    click_on 'Categoria A'
    click_on 'Editar'

    expect(page).to have_content('Categoria A')
    expect(page).not_to have_content('Categoria S')

    fill_in 'Nome', with: ''
    fill_in 'Diária', with: '-1'
    fill_in 'Seguro do carro', with: '-10'
    fill_in 'Seguro contra terceiros', with: '-200'
    click_on 'Enviar'
    
    expect(page).to have_content('Daily rate deve ser maior que 0')
    expect(page).to have_content('Car insurance deve ser maior que 0')
    expect(page).to have_content('Third part insurance deve ser maior que 0')
    
    
  end
end