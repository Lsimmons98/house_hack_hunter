require "rails_helper"
require 'view_component/test_helpers'

RSpec.describe HouseCardComponent, type: :component do
  include ViewComponent::TestHelpers

  let(:house) do
    House.new(
      id: 1,
      address: "123 Main Street",
      list_price: 350_000,
      year_built: 1985
    )
  end

  it "renders the house address" do
    result = render_inline(HouseCardComponent.new(house: house))

    rendered = Capybara.string(result.to_html)

    expect(rendered).to have_selector("h3", text: "123 Main Street")
  end

  it "renders the house list price" do
    result = render_inline(HouseCardComponent.new(house: house))

    rendered = Capybara.string(result.to_html)

    expect(rendered).to have_text("$350,000.00")
  end

  it "renders the house year built" do
    result = render_inline(HouseCardComponent.new(house: house))

    rendered = Capybara.string(result.to_html)

    expect(rendered).to have_text("Year Built: 1985")
  end
end
