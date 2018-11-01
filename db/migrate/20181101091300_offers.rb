class Offers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :message
      t.string :transaction_method
      t.string :meetup_location
      t.timestamps
  end
end

