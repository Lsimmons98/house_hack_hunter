class House < ApplicationRecord
  has_many :units, dependent: :destroy
  has_many :deals
  has_many :users, through: :deals

  accepts_nested_attributes_for :units, allow_destroy: true, reject_if: :all_blank
end
