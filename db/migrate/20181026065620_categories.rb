class Categories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :product_category
      t.datetime :created_at, null: false
      t.datetime :modified_at, null: false
    end
  end
end
