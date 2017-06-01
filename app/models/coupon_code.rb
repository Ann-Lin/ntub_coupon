class CouponCode < ApplicationRecord
  validates :discount, presence: true, numericality: { greater_than: 0 }
  validates :code, uniqueness: true

  before_save :generate_code

  private
  def generate_code
    if code.empty?
      self.code = SecureRandom.hex[1..8].upcase
    end
  end
end
