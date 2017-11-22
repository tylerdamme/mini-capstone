class ChangeInStocktoLowerCase < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :InStock, :instock
  end
end
