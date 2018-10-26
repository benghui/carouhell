class Comments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :user_comment
      t.datetime :created_at, null: false
      t.datetime :modified_at, null: false
    end
  end
end
