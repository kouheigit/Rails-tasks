class Customer < ApplicationRecord
  validates :company_name, presence: true
  validates :contact_name, presence: true
  validates :contact_email, presence: true, uniqueness: true

  validates :phone, allow_blank: true, length: { maximum: 255 }
  validates :customer_status, presence: true
  validates :memo, allow_blank: true, length: { maximum: 65_535 }
end
