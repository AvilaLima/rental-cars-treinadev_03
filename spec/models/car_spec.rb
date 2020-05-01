require 'rails_helper'

describe Car do
  context '#license_plate' do
    it 'cannot be blank' do
      fiat=Manufacturer.create!(name: 'Fiat')
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
      cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)

      car= Car.new(license_plate:'',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)

      car.valid?
      expect(car.errors[:license_plate]).to include('não pode ficar em branco')
    end
   
    it 'must be unique' do
      fiat=Manufacturer.create!(name: 'Fiat')
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
      cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
      Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)
      car= Car.new(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)
      car.valid?
      expect(car.errors[:license_plate]).to include('já está em uso')
    end
  end

  context '#color' do
    it 'cannot be blank' do
      fiat=Manufacturer.create!(name: 'Fiat')
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
      cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
      Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)
      car= Car.new(license_plate:'XDG-1090',color:'',car_model: cm,mileage:'100000',subsidiary:subsidiary)

      car.valid?
      expect(car.errors[:color]).to include('não pode ficar em branco')
    end
  end
  context '#mileage' do
    it 'cannot be blank' do
      fiat=Manufacturer.create!(name: 'Fiat')
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
      cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
      Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)
      car= Car.new(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'',subsidiary:subsidiary)

      car.valid?
      expect(car.errors[:mileage]).to include('não pode ficar em branco')
    end

    it 'cannot be less than 0' do
      fiat=Manufacturer.create!(name: 'Fiat')
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
      cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
      Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)
      car= Car.new(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'-1',subsidiary:subsidiary)
      car.valid?
      expect(car.errors[:mileage]).to include('deve ser maior que 0')
    end
  end
  context '#subsidiary' do
    it 'cannot be blank' do
      fiat=Manufacturer.create!(name: 'Fiat')
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
      cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
      Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)
      car= Car.new(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary: nil)

      car.valid?
      expect(car.errors[:subsidiary]).to include('é obrigatório(a)')
    end
  end
  context '#car_model' do
    it 'cannot be blank' do
      fiat=Manufacturer.create!(name: 'Fiat')
      subsidiary= Subsidiary.create!(name: 'Caoa',cnpj:'36.418.249/0001-69',address: 'Rua Direita,222')
      cat_e= Carcategory.create!(name: 'A',daily_rate:75,car_insurance: 100,third_part_insurance:150)
      cm = CarModel.create!(name: 'Toro', year: 2020, manufacturer: fiat, motorization: '2.0', fuel_type: 'Diesel', carcategory: cat_e)
      Car.create!(license_plate:'XDG-1090',color:'Verde',car_model: cm,mileage:'100000',subsidiary:subsidiary)
      car= Car.new(license_plate:'XDG-1090',color:'Verde',car_model: nil ,mileage:'100000',subsidiary:subsidiary)

      car.valid?
      expect(car.errors[:car_model]).to include('é obrigatório(a)')
    end
  end
end
