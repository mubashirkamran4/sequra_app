class Shopper < ApplicationRecord
  has_many :orders, inverse_of: :shopper
end
