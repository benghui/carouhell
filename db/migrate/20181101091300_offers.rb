class Offers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :product_name
      t.text :message
      t.text :transaction_method 
      t.string :meetup_location
      t.boolean :approve
      t.integer :user_id
      t.integer :product_id
      t.timestamps
  end
end