class Categories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :product_category
      t.references :product
      t.timestamps
    end
  end
end
