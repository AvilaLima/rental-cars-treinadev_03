class ThirdPartyCarModel < ActiveRecord::Migration[6.0]
  def change
    rename_column :carcategories, :third_party_insurance, :third_part_insurance
  end
end
