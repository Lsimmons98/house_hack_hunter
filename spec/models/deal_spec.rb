require 'rails_helper'

RSpec.describe Deal, type: :model do
  it { should belong_to(:house) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:interest_rate) }
  it { should validate_presence_of(:down_payment_percentage) }
  it { should validate_presence_of(:purchase_price) }
  it { should validate_presence_of(:loan_term_years) }

  describe '.good_deals_for_user' do
    let(:user) { create(:user) }
    let(:house) { create(:house, list_price: 300_000) }
    let!(:deal_good) { create(:deal, user: user, house: house, max_purchase_price: 290_000) }
    let!(:deal_bad) { create(:deal, user: user, house: house, max_purchase_price: 350_000) }

    it 'returns only the good deals for the user' do
      expect(Deal.good_deals_for_user(user.id)).to include(deal_good)
      expect(Deal.good_deals_for_user(user.id)).not_to include(deal_bad)
    end
  end
end
