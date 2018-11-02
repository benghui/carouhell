class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :slug
      t.timestamps
    end
  end
end
