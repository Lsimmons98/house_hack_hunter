class Unit < ApplicationRecord
  belongs_to :house

  validates :bedrooms, :bathrooms, :monthly_rent, presence: true
end
