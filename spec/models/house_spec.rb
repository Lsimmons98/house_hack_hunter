require 'rails_helper'

RSpec.describe House, type: :model do
  it { should have_many(:units) }
  it { should have_many(:deals) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:list_price) }
  it { should validate_presence_of(:annual_property_taxes) }
  it { should validate_presence_of(:year_built) }
end
