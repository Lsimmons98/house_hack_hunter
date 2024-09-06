House.destroy_all

house1 = House.create!(
  address: "123 Main St",
  list_price: 300_000.00,
  annual_property_taxes: 3_600.00,
  year_built: 1980
)

house2 = House.create!(
  address: "456 Oak Ave",
  list_price: 450_000.00,
  annual_property_taxes: 4_800.00,
  year_built: 1995
)

Unit.create!(house: house1, bedrooms: 2, bathrooms: 1, monthly_rent: 1_200.00)
Unit.create!(house: house1, bedrooms: 3, bathrooms: 2, monthly_rent: 1_500.00)

Unit.create!(house: house2, bedrooms: 1, bathrooms: 1, monthly_rent: 1_000.00)
Unit.create!(house: house2, bedrooms: 3, bathrooms: 2, monthly_rent: 1_700.00)

# You can manually create deals for logged-in users in the app, or adjust the seed data once you have users.
