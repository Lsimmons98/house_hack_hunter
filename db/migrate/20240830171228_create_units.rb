class CreateUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.references "house", foreign_key: true
      t.integer "bedrooms"
      t.integer "bathrooms"
      t.decimal "monthly_rent", precision: 12, scale: 2
      t.timestamps
    end
  end
end
