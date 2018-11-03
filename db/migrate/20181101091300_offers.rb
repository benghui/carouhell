class Offers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :remarks, optional: true
      t.string :transaction_method 
      t.string :meetup_location
      t.boolean :approve
      t.references :user
      t.references :product
      t.timestamps
    end
  end
end