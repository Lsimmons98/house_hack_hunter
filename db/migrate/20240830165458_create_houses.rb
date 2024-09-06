class CreateHouses < ActiveRecord::Migration[7.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.decimal :list_price, precision: 12, scale: 2
      t.decimal :annual_property_taxes, precision: 10, scale: 2
      t.integer :year_built
      t.timestamps
    end
  end
end
