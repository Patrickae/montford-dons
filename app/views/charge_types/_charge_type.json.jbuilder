json.extract! charge_type, :id, :name, :amount, :frequency, :created_at, :updated_at
json.url charge_type_url(charge_type, format: :json)
