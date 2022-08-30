class Merchant < ApplicationRecord
  has_many :orders, inverse_of: :merchant
  validates :email, presence: true, uniqueness: true
  validates :cif, presence: true
end
