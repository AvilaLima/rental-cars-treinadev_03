require 'rails_helper'

describe CarModel, type: :model do
  context 'validation' do
    it 'name cannot be blank' do
      carmodel = CarModel.new

      carmodel.valid?

      expect(carmodel.errors[:name]).to include('não pode ficar em branco')
    end

    it 'year cannot be blank' do
      carmodel = CarModel.new

      carmodel.valid?

      expect(carmodel.errors[:year]).to include('não pode ficar em branco')
    end

    it 'motorization cannot be blank' do
      carmodel = CarModel.new

      carmodel.valid?

      expect(carmodel.errors[:name]).to include('não pode ficar em branco')
    end

    it 'fuel_type cannot be blank' do
      carmodel = CarModel.new

      carmodel.valid?

      expect(carmodel.errors[:name]).to include('não pode ficar em branco')
    end
  end
end
