class AddPurchasesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :purchases, :integer, default: 0
  end
end
