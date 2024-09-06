require 'rails_helper'

RSpec.describe Deal, type: :model do
  # Association tests
  it { should belong_to(:user) }
  it { should belong_to(:house) }
  it { should have_many(:units).through(:house) }

  # Validation tests
  it { should validate_presence_of(:interest_rate) }
  it { should validate_presence_of(:down_payment_percentage) }
  it { should validate_presence_of(:purchase_price) }
  it { should validate_presence_of(:loan_term_years) }
  it { should validate_presence_of(:rehab_cost) }
  it { should validate_presence_of(:holding_cost) }
  it { should validate_presence_of(:utilities) }
  it { should validate_presence_of(:lawn_care) }
  it { should validate_presence_of(:insurance) }
  it { should validate_presence_of(:vacancy) }
  it { should validate_presence_of(:maintenance) }
  it { should validate_presence_of(:capital_expenditure) }
  it { should validate_presence_of(:property_management) }
  it { should validate_presence_of(:closing_costs) }

  describe ".for_user" do
    it "returns deals for the given user" do
      user = create(:user)
      house = create(:house)
      deal = create(:deal, user: user, house: house)

      expect(Deal.for_user(user.id)).to include(deal)
    end
  end


  describe "#total_cash_needed" do
    it "calculates the total cash needed" do
      deal = build(:deal, purchase_price: 300_000.00)
      total_cash = deal.total_cash_needed
      expect(total_cash).to be_a(Numeric)
    end
  end

  describe "#total_income" do
    it "calculates the total monthly income from all units" do
      house = create(:house)
      create(:unit, house: house, monthly_rent: 1500.00)
      deal = create(:deal, house: house)

      expect(deal.total_income).to eq(1500.00)
    end
  end

  describe "#total_expenses" do
    it "calculates the total expenses" do
      deal = build(:deal)
      total_expenses = deal.total_expenses
      expect(total_expenses).to be_a(Numeric)
    end
  end

  describe "#net_operating_income" do
    it "calculates the net operating income" do
      deal = build(:deal)
      noi = deal.net_operating_income
      expect(noi).to be_a(Numeric)
    end
  end

  describe "#cash_flow" do
    it "calculates the cash flow" do
      deal = build(:deal)
      cash_flow = deal.cash_flow
      expect(cash_flow).to be_a(Numeric)
    end
  end

  describe "#cash_on_cash_return" do
    it "calculates the cash-on-cash return percentage" do
      deal = build(:deal)
      coc_return = deal.cash_on_cash_return
      expect(coc_return).to be_a(Numeric)
    end
  end

  describe "#max_purchase_price" do
    it "calculates the max purchase price based on target return" do
      deal = build(:deal)
      max_price = deal.max_purchase_price(1000, 10)
      expect(max_price).to be_a(Numeric)
    end
  end
end
