class Product < ApplicationRecord
  belongs_to :coupon_code, optional: true
  validates :title, presence: true
  validates :price, presence: true

  def apply_coupon(coupon)
    if coupon.is_valid_code?
      self.price -= coupon.discount
      self.price = 0 if self.price <= 0
    else
      errors[:coupon_code] << "無效"
    end
  end
end
