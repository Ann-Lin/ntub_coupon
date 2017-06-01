class CouponCode < ApplicationRecord
  has_many :products
  validates :discount, presence: true, numericality: { greater_than: 0 }
  validates :code, uniqueness: true

  before_save :generate_code

  def is_valid_code?
    (begin_at < Time.now.beginning_of_day) && (end_at > Time.now.end_of_day)
  end

  private
  def generate_code
    if code.empty?
      self.code = SecureRandom.hex[1..8].upcase
    else
      self.code = code.upcase
    end
  end
end
