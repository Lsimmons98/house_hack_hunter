FactoryBot.define do
  factory :deal do
    user
    house
    interest_rate { 3.5 }
    down_payment_percentage { 20.0 }
    purchase_price { 300_000.00 }
    loan_term_years { 30 }
    rehab_cost { 10_000.00 }
    holding_cost { 5_000.00 }
    utilities { 2_000.00 }
    lawn_care { 1_000.00 }
    insurance { 2_500.00 }
    vacancy { 5.0 }
    maintenance { 5.0 }
    capital_expenditure { 5.0 }
    property_management { 5.0 }
    closing_costs { 3.0 }
  end
end
