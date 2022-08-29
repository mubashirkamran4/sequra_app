class Order < ApplicationRecord
  belongs_to :merchant, inverse_of: :orders
  belongs_to :shopper, inverse_of: :orders
end
