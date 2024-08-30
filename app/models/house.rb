class House < ApplicationRecord
  has_many :units
  has_many :deals
  has_many :users, through: :deals

end
