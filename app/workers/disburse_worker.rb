
class DisburseWorker

  def self.perform
    Order.undisbursed_completed_orders.each do |order|
      order_amount = order.amount
      disbursement_amount = if order_amount < 50
               (order_amount * 1)/100
             elsif order_amount >= 50 && order_amount <= 300
               (order_amount * 0.95)/100
             else
               (order_amount * 0.85)/100
             end
      order.update!(disbursement_amount: disbursement_amount, disbursed_at: Time.now)
    end
  end

end