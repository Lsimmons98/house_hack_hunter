class CreateDeals < ActiveRecord::Migration[7.1]
  def change
    create_table :deals do |t|
      t.references :user, foreign_key: true
      t.references :house, foreign_key: true

      t.decimal :interest_rate, precision: 5, scale: 2
      t.decimal :down_payment_percentage, precision: 5, scale: 2
      t.decimal :purchase_price, precision: 12, scale: 2
      t.integer :loan_term_years
      t.decimal :rehab_cost, precision: 12, scale: 2
      t.decimal :holding_cost, precision: 12, scale: 2

      # Additional Costs
      t.decimal :utilities, precision: 12, scale: 2
      t.decimal :lawn_care, precision: 12, scale: 2
      t.decimal :insurance, precision: 12, scale: 2

      # Percentage-based Expenses
      t.decimal :vacancy, precision: 5, scale: 2
      t.decimal :maintenance, precision: 5, scale: 2
      t.decimal :capital_expenditure, precision: 5, scale: 2
      t.decimal :property_management, precision: 5, scale: 2
      t.decimal :closing_costs, precision: 5, scale: 2

      t.timestamps
    end
  end
end
