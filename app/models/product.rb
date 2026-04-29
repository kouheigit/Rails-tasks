class Product < ApplicationRecord
  validates :code, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :category, presence: true, inclusion: { in: ["食品", "日用品", "電化製品", "衣類", "その他"] }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :alert_threshold, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :is_active, inclusion: { in: [true, false] }
end
