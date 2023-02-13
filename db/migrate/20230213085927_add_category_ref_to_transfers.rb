class AddCategoryRefToTransfers < ActiveRecord::Migration[7.0]
  def change
    add_reference :transfers, :category, null: false, foreign_key: true, index:true
  end
end
