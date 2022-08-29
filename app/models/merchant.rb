class Merchant < ApplicationRecord
  has_many :orders, inverse_of: :merchant
  validates :email, presence: true
  validates :cif, presence: true

end
