class AddFieldsToCarModel < ActiveRecord::Migration[6.0]
  def change
    add_column :car_models, :motorization, :string
    add_column :car_models, :fuel_type, :string
    add_reference :car_models, :carcategory, foreign_key: true
  end
end
