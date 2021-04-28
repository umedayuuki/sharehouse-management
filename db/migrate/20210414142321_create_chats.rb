class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :user_name, null: false
      t.string :talk, null: false
      t.references :house, foreign_key: true
      t.timestamps
    end
  end
end
