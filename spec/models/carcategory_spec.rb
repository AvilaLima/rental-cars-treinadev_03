require 'rails_helper'

describe Carcategory do
  context '#name' do     
    it 'cannot be blank' do
      carcategory = Carcategory.new(name: '',daily_rate:100,car_insurance: 150,third_part_insurance:125)
      carcategory.valid?
      expect(carcategory.errors[:name]).to include('Nome não pode ficar em branco')
    end

    it 'must be unique' do
      Carcategory.create!(name: 'A',daily_rate:100,car_insurance: 150,third_part_insurance:125)
      carcategory = Carcategory.new(name: 'A',daily_rate:100,car_insurance: 150,third_part_insurance:125)
      carcategory.valid?
      expect(carcategory.errors[:name]).to include('Nome deve ser único')
    end 
  end

  context '#daily_rate' do
    it 'cannot be less than 0' do
      carcategory = Carcategory.new(name: 'E',daily_rate:0,car_insurance: 150,third_part_insurance:125)
      carcategory.valid?
      expect(carcategory.errors[:daily_rate]).to include('deve ser maior que 0')
    end
  end
  context '#car_insurance' do
    it 'cannot be less than 0' do
      carcategory = Carcategory.new(name: 'E',daily_rate:110,car_insurance: 0,third_part_insurance:125)
      carcategory.valid?
      expect(carcategory.errors[:car_insurance]).to include('deve ser maior que 0')
    end
  end
  context '#third_part_insurance' do
    it 'cannot be less than 0' do
      carcategory = Carcategory.new(name: 'E',daily_rate:120,car_insurance: 150,third_part_insurance:0)
      carcategory.valid?
      expect(carcategory.errors[:third_part_insurance]).to include('deve ser maior que 0')
    end
  end
end
