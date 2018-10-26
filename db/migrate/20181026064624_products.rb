class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :price
      t.integer :seller_id
      t.integer :buyer_id
      t.datetime :created_at, null: false
      t.datetime :modified_at, null: false
      t.string :image_url
      t.text :description
    end
  end
end
