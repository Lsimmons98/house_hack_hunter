FactoryBot.define do
  factory :unit do
    house
    bedrooms { 3 }
    bathrooms { 2 }
    monthly_rent { 1500.00 }
  end
end
