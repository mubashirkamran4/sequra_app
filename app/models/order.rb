class Order < ApplicationRecord
  belongs_to :merchant, inverse_of: :orders
  belongs_to :shopper, inverse_of: :orders
  scope :undisbursed_completed_orders, -> { where.not(completed_at: nil).where(disbursement_amount: nil) }
end
