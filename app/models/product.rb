class Product < ApplicationRecord

  belongs_to :product_category
  validates :product_category, presence: true
  validates :code, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :alert_threshold, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :is_active, inclusion: { in: [true, false] }

  
  def low_stock?
    stock <= alert_threshold
  end

 
  def status_label
    return "停止中" unless is_active
    return "要補充" if low_stock?

    "正常"
  end
end
