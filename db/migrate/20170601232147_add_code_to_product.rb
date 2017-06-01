class AddCodeToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :coupon_code_id, :integer, index: true
  end
end
