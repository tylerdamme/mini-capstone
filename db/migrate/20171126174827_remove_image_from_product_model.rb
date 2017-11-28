class RemoveImageFromProductModel < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :image, :string
  end
end
