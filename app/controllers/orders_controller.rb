class OrdersController < ApplicationController
  def disbursements_per_week
    week_start = params['date'].to_datetime.beginning_of_week.utc
    week_end = params['date'].to_datetime.end_of_week.utc
    if params['merchant_id'].blank?
      render json: Order.where("disbursed_at > ? AND disbursed_at < ?", week_start, week_end).select(:merchant_id, :disbursement_amount).as_json(except: :id)
    else
      render json: Order.where(merchant_id: params['merchant_id']).where("disbursed_at > ? AND disbursed_at < ?", week_start, week_end).select(:merchant_id, :disbursement_amount).as_json(except: :id)
    end
  end
end