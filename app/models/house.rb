class House < ApplicationRecord
  has_many :units, dependent: :destroy
  has_many :deals
  has_many :users, through: :deals

  validates :address, :list_price, :annual_property_taxes, :year_built, presence: true

  accepts_nested_attributes_for :units, allow_destroy: true, reject_if: :all_blank
end
