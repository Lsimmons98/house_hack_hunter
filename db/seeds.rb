# Clear existing data
User.destroy_all
House.destroy_all
Deal.destroy_all
Unit.destroy_all

# Create users
user1 = User.create!(
  email: "user1@example.com",
  password: "password"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password"
)

# Create houses with units
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

# Create units for house1
Unit.create!(house: house1, bedrooms: 2, bathrooms: 1, square_footage: 800, monthly_rent: 1_200.00)
Unit.create!(house: house1, bedrooms: 3, bathrooms: 2, square_footage: 1_100, monthly_rent: 1_500.00)

# Create units for house2
Unit.create!(house: house2, bedrooms: 1, bathrooms: 1, square_footage: 600, monthly_rent: 1_000.00)
Unit.create!(house: house2, bedrooms: 3, bathrooms: 2, square_footage: 1_200, monthly_rent: 1_700.00)

# Create deals for user1
Deal.create!(
  user: user1,
  house: house1,
  interest_rate: 5.5,
  down_payment_percentage: 10,
  purchase_price: house1.list_price,
  term_years: 30,
  rehab_cost: 5_000.00,
  holding_cost: 2_000.00,
  utilities: 200.00,
  lawn_care: 50.00,
  insurance: 100.00,
  vacancy: 5.0,
  maintenance: 5.0,
  capital_expenditure: 5.0,
  property_management: 10.0,
  closing_costs: 3.0
)

Deal.create!(
  user: user1,
  house: house2,
  interest_rate: 4.75,
  down_payment_percentage: 15,
  purchase_price: house2.list_price,
  term_years: 25,
  rehab_cost: 10_000.00,
  holding_cost: 3_000.00,
  utilities: 250.00,
  lawn_care: 75.00,
  insurance: 120.00,
  vacancy: 5.0,
  maintenance: 5.0,
  capital_expenditure: 5.0,
  property_management: 10.0,
  closing_costs: 3.5
)

# Create deals for user2
Deal.create!(
  user: user2,
  house: house2,
  interest_rate: 6.0,
  down_payment_percentage: 12,
  purchase_price: house2.list_price,
  term_years: 30,
  rehab_cost: 7_000.00,
  holding_cost: 1_500.00,
  utilities: 230.00,
  lawn_care: 65.00,
  insurance: 110.00,
  vacancy: 4.5,
  maintenance: 5.0,
  capital_expenditure: 4.0,
  property_management: 9.0,
  closing_costs: 2.5
)

puts "Database seeded successfully!"
