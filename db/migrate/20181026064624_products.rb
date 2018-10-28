class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :price
      t.references :seller, index: true, foreign_key: {to_table: :users}
      t.references :buyer, index: true, foreign_key: {to_table: :users}
      t.references :category
      t.timestamps
      t.string :image_url
      t.text :description
    end
  end
end
