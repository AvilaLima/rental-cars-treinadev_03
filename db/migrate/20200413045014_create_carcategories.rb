class CreateCarcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :carcategories do |t|
      t.string :name
      t.decimal :daily_rate
      t.decimal :car_insurance
      t.decimal :third_party_insurance

      t.timestamps
    end
  end
end
