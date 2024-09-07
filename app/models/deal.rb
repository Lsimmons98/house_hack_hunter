class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :house
  has_many :units, through: :house

  validates :interest_rate, :down_payment_percentage, :purchase_price,
  :loan_term_years, :rehab_cost, :holding_cost,
  :utilities, :lawn_care, :insurance,
  :vacancy, :maintenance, :capital_expenditure,
  :property_management, :closing_costs, presence: true

  scope :for_user, ->(user_id) { where(user_id: user_id).joins(:house) }

  def total_cash_needed
    calculate_total_cash_needed(purchase_price, purchase_price)
  end

  def total_income
    income = 0
    units.each do |unit|
      income = income + unit.monthly_rent
    end
    income
  end

  def total_expenses
    vacancy_amount = vacancy * total_income / 100.0
    maintenance_amount = maintenance * total_income / 100.0
    capex_amount = capital_expenditure * total_income / 100.0
    management_amount = property_management * total_income / 100.0
    vacancy_amount + maintenance_amount + capex_amount + management_amount +
    utilities + lawn_care + insurance + house.annual_property_taxes/12.0
  end

  def monthly_payment
    calculate_monthly_payment purchase_price, purchase_price
  end

  def net_operating_income
    total_income - total_expenses
  end

  def cash_flow
    calculate_cash_flow monthly_payment
  end

  def cash_on_cash_return
    calculate_cash_on_cash_return cash_flow, total_cash_needed
  end

  def max_purchase_price(accuracy, max_iterations)
    max_purchase_price = house.list_price

    target_return_lower_bound = 7.5
    target_return_upper_bound = 8.5

    incremented_up = false
    incremented_down = false

    iterations = 0

    loop do
      iterations += 1

      monthly_payment = calculate_monthly_payment(purchase_price, max_purchase_price)
      total_cash_needed = calculate_total_cash_needed(purchase_price, max_purchase_price)
      cash_flow = calculate_cash_flow(monthly_payment)
      cash_on_cash_return = calculate_cash_on_cash_return(cash_flow, total_cash_needed)

      if cash_on_cash_return >= target_return_lower_bound && cash_on_cash_return <= target_return_upper_bound
        break
      elsif cash_on_cash_return < target_return_lower_bound
        max_purchase_price -= accuracy
        incremented_down = true
      else
        max_purchase_price += accuracy
        incremented_up = true
      end

      if incremented_down && incremented_up
        break
      end

      if iterations >= max_iterations
        max_purchase_price = " / Max Purchase Price Too Far From Listing Price: Bad Deal"
        break
      end
    end

    max_purchase_price
  end
  #
  # def max_purchase_price a, b
  #   money_down = down_payment_percentage * purchase_price / 100.0
  #   monthly_interest_rate = interest_rate / 12.0 / 100.0
  #   total_payments = loan_term_years * 12
  #   price = (100 * (money_down - 150 * money_down * monthly_interest_rate) * ((-monthly_interest_rate + 1)**total_payments) -  money_down * ((-monthly_interest_rate + 1)**total_payments) + rehab_cost + holding_cost - (rehab_cost * (-monthly_interest_rate + 1)**total_payments) - (holding_cost * (-monthly_interest_rate + 1)**total_payments))/
  #   ((-closing_costs) + (closing_costs * (-monthly_interest_rate + 1)**total_payments) - ((15000 * monthly_interest_rate) * (-monthly_interest_rate + 1)**total_payments))
  #   price
  # end


private

  def calculate_monthly_payment user_purchase_price, new_purchase_price
    money_down = down_payment_percentage * user_purchase_price / 100.0
    loan_amount = new_purchase_price - money_down
    monthly_interest_rate = interest_rate / 12.0 / 100.0
    total_payments = loan_term_years * 12
    monthly_payment = (loan_amount * monthly_interest_rate * (1 + monthly_interest_rate)**total_payments) / ((1 + monthly_interest_rate)**total_payments - 1)
    monthly_payment = (monthly_payment * 100).ceil / 100.0
    monthly_payment
  end

  def calculate_total_cash_needed user_purchase_price, new_purchase_price
    down_payment = down_payment_percentage * user_purchase_price / 100.0
    closing_expense = closing_costs * new_purchase_price / 100.0
    down_payment + closing_expense + rehab_cost + holding_cost
  end

  def calculate_cash_flow monthly_payment
    net_operating_income - monthly_payment
  end

  def calculate_cash_on_cash_return cash_flow, total_cash_needed
    (cash_flow * 12 / total_cash_needed * 100).round(2)
  end

end
