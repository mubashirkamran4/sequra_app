class OrdersController < ApplicationController
  def disbursements_per_week
    if params['merchant_id'].blank?
      render json: Order.where("disbursed_at > ?", Time.now.beginning_of_week.utc).select(:merchant_id, :disbursement_amount).as_json(except: :id)
    else
      render json: Order.where(merchant_id: params['merchant_id']).where("disbursed_at > ?", Time.now.beginning_of_week.utc).select(:merchant_id, :disbursement_amount).as_json(except: :id)
    end
  end
end