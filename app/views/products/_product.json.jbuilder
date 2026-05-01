json.extract! product, :id, :code, :name, :product_category_id, :price, :stock, :alert_threshold, :is_active, :description, :created_at, :updated_at
json.product_category_name product.product_category.name
json.url product_url(product, format: :json)
