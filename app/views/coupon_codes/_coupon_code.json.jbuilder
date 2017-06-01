json.extract! coupon_code, :id, :code, :discount, :begin_at, :end_at, :allow_multiple_usage, :created_at, :updated_at
json.url coupon_code_url(coupon_code, format: :json)
