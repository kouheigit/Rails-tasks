json.extract! product, :id, :code, :name, :category, :price, :stock, :alert_threshold, :is_active, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
