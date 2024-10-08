class User < ApplicationRecord
  has_many :deals, dependent: :destroy
  has_many :houses, through: :deals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
