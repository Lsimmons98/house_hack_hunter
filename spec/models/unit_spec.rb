require 'rails_helper'

RSpec.describe Unit, type: :model do
  it { should belong_to(:house) }
  it { should validate_presence_of(:bedrooms) }
  it { should validate_presence_of(:bathrooms) }
  it { should validate_presence_of(:monthly_rent) }
end
