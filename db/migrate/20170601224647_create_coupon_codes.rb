class CreateCouponCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :coupon_codes do |t|
      t.string :code
      t.integer :discount
      t.datetime :begin_at
      t.datetime :end_at
      t.boolean :allow_multiple_usage

      t.timestamps
    end
  end
end
