class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.decimal :price, precision: 10, scale: 2
      t.references :seller, index: true, foreign_key: {to_table: :users}
      t.references :buyer, index: true, foreign_key: {to_table: :users}
      t.references :category
      t.string :image_url
      t.text :description
      t.string :place
      t.text :address
      t.float :latitude
      t.float :longitude


      t.timestamps
    end
  end
end
