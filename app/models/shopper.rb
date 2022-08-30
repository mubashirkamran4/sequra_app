class Shopper < ApplicationRecord
  has_many :orders, inverse_of: :shopper
  validates :email, presence: true, uniqueness: true
  validates :nif, presence: true
end
