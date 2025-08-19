json.extract! user, :id, :email_address, :first_name, :last_name, :phone_number, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
