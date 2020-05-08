require 'rails_helper'

RSpec.describe Rental, type: :model do
  it 'should generate a code on create' do
    customer = Customer.create!(name: 'Teste',
                                email: 'teste@gmail.com',
                                document: '100.954.020-39')
    cat_c= Carcategory.create!(name: 'Coupe',daily_rate:500,car_insurance: 150,
                                third_part_insurance:300)
    rental = Rental.new(start_date: 1.day.from_now, end_date: 2.days.from_now,
                        customer: customer, carcategory: cat_c)
    rental.save

    expect(rental.code).to_not be_blank
    
  end
end
