json.extract! customer, :id, :company_name, :contact_name, :contact_email, :phone, :customer_status, :memo, :created_at, :updated_at
json.url customer_url(customer, format: :json)
