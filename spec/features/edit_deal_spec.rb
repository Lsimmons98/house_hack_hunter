require 'rails_helper'

RSpec.feature "Deal Method Recalculation From Edit", type: :feature do
  scenario "User calculates max purchase price based on changing interest rate" do
    house = create(:house, list_price: 300_000)
    user = create(:user)
    deal = create(:deal, house: house, user: user)

    visit house_path(house)
    fill_in "deal_interest_rate", with: '4.5'
    click_button 'Calculate'

    expect(page).to have_content('Max Purchase Price: $')
  end
end
