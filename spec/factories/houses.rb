FactoryBot.define do
  factory :house do
    address { "123 Main St" }
    list_price { 300_000.00 }
    annual_property_taxes { 5_000.00 }
    year_built { 2000 }
  end
end
