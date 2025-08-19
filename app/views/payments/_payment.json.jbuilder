json.extract! payment, :id, :week_id, :charge_type_id, :user_id, :total_paid, :paid_on, :created_at, :updated_at
json.url payment_url(payment, format: :json)
