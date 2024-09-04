require 'rails_helper'

RSpec.describe Deal, type: :model do
  it { should belong_to(:house) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:interest_rate) }
  it { should validate_presence_of(:down_payment_percentage) }
  it { should validate_presence_of(:purchase_price) }
  it { should validate_presence_of(:loan_term_years) }
end
